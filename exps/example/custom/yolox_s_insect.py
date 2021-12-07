#!/usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright (c) Megvii, Inc. and its affiliates.
import os

from yolox.exp import Exp as MyExp


class Exp(MyExp):
    def __init__(self):
        super(Exp, self).__init__()
        self.depth = 0.33
        self.width = 0.50
        self.exp_name = os.path.split(os.path.realpath(__file__))[1].split(".")[0]

        # Define yourself dataset path
        self.data_dir = "datasets/COD10K-insect"
        self.train_ann = "CAM_Instance_Train.json"
        self.val_ann = "CAM_Instance_Test.json"

        self.num_classes = 1

        self.data_num_workers = 1

        # self.max_epoch = 300
        # self.data_num_workers = 4
        # self.eval_interval = 1

        # self.input_size = (640, 640) 
        # self.random_size = (20, 40)
