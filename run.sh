# Test PixelSplat

# Test on ACID with pre-trained weights
python3 -m src.main +experiment=acid mode=test exp_name='test_acid' hydra.run.dir='outputs/test_acid' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_acid.json test.output_path=outputs/test_acid/test


# Test on Kitti360 with pre-trained weights (debug)
python3 -m src.main +experiment=kitti360 mode=test exp_name='test_kitti360_debug' hydra.run.dir='outputs/test_kitti360_debug' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_kitti360_debug.json test.output_path=outputs/test_kitti360_debug


# Test on Kitti360 with pre-trained weights
python3 -m src.main +experiment=kitti360 mode=test exp_name='test_kitti360' hydra.run.dir='outputs/test_kitti360' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_kitti360.json test.output_path=outputs/test_kitti360 dataset.roots=[datasets/kitti360/test_images_cam02_0_249] 


+experiment=kitti360 
mode=test 
exp_name='test_kitti360'
hydra.run.dir='outputs/test_kitti360' 
dataset/view_sampler=evaluation 
checkpointing.load=pretrained_models/acid.ckpt 
dataset.view_sampler.index_path=assets/evaluation_index_kitti360.json 
test.output_path=outputs/test_kitti360 
dataset.roots=[datasets/kitti360/test_images_cam02_0_249] 

