# Test PixelSplat

# Test on ACID with pre-trained weights
python3 -m src.main +experiment=acid mode=test exp_name='test_acid' hydra.run.dir='outputs/test_acid' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_acid.json test.output_path=outputs/test_acid/test



# Test on Kitti360 with pre-trained weights
python3 -m src.main +experiment=kitti360 mode=test exp_name='test_kitti360' hydra.run.dir='outputs/test_kitti360' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_kitti360.json test.output_path=outputs/test_kitti360/test

# Test without checkpoint
python3 -m src.main +experiment=kitti360 mode=test exp_name='test_kitti360_rnd' hydra.run.dir='outputs/test_kitti360_rnd' dataset/view_sampler=evaluation dataset.view_sampler.index_path=assets/evaluation_index_kitti360.json test.output_path=outputs/test_kitti360_rnd/test

