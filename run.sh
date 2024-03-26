# Test PixelSplat

# Test on ACID with pre-trained weights
python3 -m src.main +experiment=acid mode=test exp_name='exp_test_acid_rnd' hydra.run.dir='outputs/exp_test_acid_rnd' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_acid.json

# Test without checkpoint
python3 -m src.main +experiment=acid mode=test exp_name='exp_test_acid' hydra.run.dir='outputs/exp_test_acid' dataset/view_sampler=evaluation dataset.view_sampler.index_path=assets/evaluation_index_acid.json




