#!/usr/bin/env python
# coding: utf-8


import av
import cv2
import mediapipe as mp
import numpy as np
import streamlit as st

# import logging
# logging.basicConfig(level=logging.DEBUG)

import streamlit_webrtc


from streamlit_webrtc import webrtc_streamer, VideoTransformerBase, RTCConfiguration

# RTCConfiguration for secure connection
RTC_CONFIGURATION = RTCConfiguration({
    "iceServers": [{"urls": ["stun:stun.l.google.com:19302"]}]
})

# MediaPipe Face Mesh model initialization
mp_face_mesh = mp.solutions.face_mesh
face_mesh = mp_face_mesh.FaceMesh(max_num_faces=2, min_detection_confidence=0.5, min_tracking_confidence=0.5)
mp_drawing = mp.solutions.drawing_utils

# Define VideoTransformer for processing video frames
class VideoTransformer(VideoTransformerBase):
    def __init__(self):
        self.face_mesh = mp_face_mesh.FaceMesh(max_num_faces=2, min_detection_confidence=0.5, min_tracking_confidence=0.5)
    
    def transform(self, frame):
        img = frame.to_ndarray(format="bgr24")
        img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        results = self.face_mesh.process(img_rgb)

        if results.multi_face_landmarks:
            for face_landmarks in results.multi_face_landmarks:
                mp_drawing.draw_landmarks(img, face_landmarks, mp_face_mesh.FACE_CONNECTIONS,
                                           mp_drawing.DrawingSpec(color=(80,110,10), thickness=1, circle_radius=1),
                                           mp_drawing.DrawingSpec(color=(80,256,121), thickness=3, circle_radius=1))
        
        return img

# Streamlit app settings
st.title("リアルタイムフェイスランドマーク検出")
st.write("Webカメラの映像をストリームリットで処理してリアルタイムに表示します。")

# WebRTC streamer using the custom VideoTransformer
webrtc_streamer(key="example", 
                video_transformer_factory=VideoTransformer,
                rtc_configuration=RTC_CONFIGURATION)
