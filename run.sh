# Test

# Test PixelSplat on ACID with pre-trained weights
python3 -m src.main +experiment=acid mode=test exp_name='exp_test_acid_rnd' hydra.run.dir='outputs/exp_test_acid_rnd' dataset/view_sampler=evaluation checkpointing.load=pretrained_models/acid.ckpt dataset.view_sampler.index_path=assets/evaluation_index_acid.json

# Test without checkpoint
python3 -m src.main +experiment=acid mode=test exp_name='exp_test_acid' hydra.run.dir='outputs/exp_test_acid' dataset/view_sampler=evaluation dataset.view_sampler.index_path=assets/evaluation_index_acid.json


Acces to machine
ssh -X angelika@10.201.20.7
conda activate fisheye_psplat  # activate the conda environment, here it's possible to install new libraries if needed but only after activating the environment
cd fisheye_psplat



# Train

# Train without checkpoint
python3 -m src.main +experiment=acid exp_name='train_acid_rnd' hydra.run.dir='outputs/train_acid_rnd' wandb.mode=disabled data_loader.train.batch_size=1 trainer.val_check_interval=30 optimizer.warm_up_steps=1000 checkpointing.every_n_train_steps=5000

# Train with checkpoint
python3 -m src.main +experiment=acid exp_name='train_acid_pretr_enc' hydra.run.dir='outputs/train_acid_pretr_enc' wandb.mode=disabled data_loader.train.batch_size=1 trainer.val_check_interval=30 optimizer.warm_up_steps=1000 checkpointing.every_n_train_steps=5000 trainer.max_steps=50000 checkpointing.load=pretrained_models/encoder.ckpt 
