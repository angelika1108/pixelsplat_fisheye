# Test PixelSplat

# Test on ACID with pre-trained weights
python3 -m src.main +experiment=acid mode=test exp_name='test_acid' hydra.run.dir='outputs/test_acid' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_acid.json test.output_path=outputs/test_acid/test


# Test on Kitti360 with pre-trained weights (debug)
python3 -m src.main +experiment=kitti360 mode=test exp_name='test_kitti360_debug' hydra.run.dir='outputs/test_kitti360_debug' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_kitti360_debug.json test.output_path=outputs/test_kitti360_debug


# Test on Kitti360 with pre-trained weights
python3 -m src.main +experiment=kitti360 mode=test exp_name='test_kitti360' hydra.run.dir='outputs/test_kitti360' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_kitti360.json test.output_path=outputs/test_kitti360 dataset.roots=[datasets/kitti360/test_images_cam02_0_249] 

#### Breaking down the test command:
# python3 -m src.main
# +experiment=kitti360 
# mode=test 
# exp_name='test_kitti360'
# hydra.run.dir='outputs/test_kitti360' 
# dataset/view_sampler=evaluation 
# checkpointing.load=pretrained_models/acid.ckpt 
# dataset.view_sampler.index_path=assets/evaluation_index_kitti360.json 
# test.output_path=outputs/test_kitti360 
# dataset.roots=[datasets/kitti360/test_images_cam02_0_249] 



# Calculate metrics

# PixelSplat on ACID
python3 -m src.scripts.compute_metrics +experiment=acid +evaluation=acid output_metrics_path=outputs/test_acid/test/acid/evaluation_metrics.json evaluation.methods.0.path=outputs/test_acid/test/acid

# PixelSplat on KITTI360 debug
python3 -m src.scripts.compute_metrics +experiment=kitti360 +evaluation=kitti360_debug dataset.roots=[datasets/kitti360] output_metrics_path=outputs/test_kitti360_debug/kitti360/evaluation_metrics.json evaluation.methods.0.path=outputs/test_kitti360_debug/kitti360

# PixelSplat on KITTI360
python3 -m src.scripts.compute_metrics +experiment=kitti360 +evaluation=kitti360 dataset.roots=[datasets/kitti360/test_images_rectified_0_249] output_metrics_path=outputs/test_kitti360/kitti360/evaluation_metrics.json evaluation.methods.0.path=outputs/test_kitti360/kitti360

#### Breaking down the calculate metrics command:
# python3 -m src.scripts.compute_metrics 
# +experiment=kitti360 
# +evaluation=kitti360 
# dataset.roots=[datasets/kitti360/test_images_rectified_0_249] 
# output_metrics_path=outputs/test_kitti360/kitti360/evaluation_metrics.json 
# evaluation.methods.0.path=outputs/test_kitti360/kitti360




# Estimated rectified fisheye camera parameters by NerfStudio
"fl_x": 947.5964796581311   / 700
"fl_y": 440.9180126120826  / 700
"cx": 216.2577815920706   / 700
"cy": 335.75905987919214  / 700
