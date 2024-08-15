# PixelSplat_fisheye

This is a (slightly modified) copy of **[pixelSplat:](https://github.com/dcharatan/pixelsplat) 3D Gaussian Splats from Image Pairs for Scalable Generalizable 3D Reconstruction** by David Charatan, Sizhe Li, Andrea Tagliasacchi, and Vincent Sitzmann.

The goal of this project is to test pixelSplat on the fisheye images of the [KITTI-360 dataset](https://www.cvlibs.net/datasets/kitti-360/). A code is added to rectify the fisheye images of KITTI-360 as well as to transform the fisheye images, intrinsics and extrinsics to the format pixelSplat uses in its Real Estate 10k dataloader.

For the necessary library installations and information about datasets, training, evaluation, etc. please visit the [GitHub page](https://github.com/dcharatan/pixelsplat) of pixelSplat.


## BibTeX

```
@inproceedings{charatan23pixelsplat,
      title={pixelSplat: 3D Gaussian Splats from Image Pairs for Scalable Generalizable 3D Reconstruction},
      author={David Charatan and Sizhe Li and Andrea Tagliasacchi and Vincent Sitzmann},
      year={2023},
      booktitle={arXiv},
}
```
