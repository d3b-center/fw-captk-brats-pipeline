# CaPTk BRATS pipeline

This tool provides a pipeline for pre-processing and auto-segmentation of structural images. Steps include: (1) orientation to standard (LPS/RAI) coordinates, (2) registration to SRI atlas, (3) skull stripping, (4) auto-segmentation with trained CNN model from BRATS 2017 challenge. User should manually check registration results. For best results T1 images should be 3D mprage sequences. If auto-segmentation model doesn't find a solution, output mask file will contain all zeros.

Main documentation: https://cbica.github.io/CaPTk/preprocessing_brats.html

### Classification

_Category:_ Analysis

_Gear Level:_

- [ ] Project
- [ ] Subject
- [x] Session
- [ ] Acquisition
- [ ] Analysis


# Main functionality

Detailed description of gear functions. Include relevant links to sources & frameworks. Use separate sub-headings as needed to describe different stages or functions.

## Dependencies:

- CaPTk

## Inputs:

- **T1**: T1-weighted image no contrast agent (nifti)
- **T1CE**: T1-weighted image with contrast agent (nifti)
- **T2**: T2-weighted image (nifti)
- **FLAIR**: Fluid attenuated inversion recovery image (nifti)
- **ADC**: Diffusion ADC image (nifti)

The gear can take up to 5 sequences as input. ADC will only be processed if all 4 other "main" sequences (T1/T1CE/T2/FLAIR) are input. If less than the 4 main sequences are found, missing sequences will be replaced by temporary copies of the found sequences as follows:

- If T1 is missing, will be replaced by T1CE.
- If T1CE is missing, will be replaced by T1.
- If T1 and T1CE are missing, both are replaced with T2. If T2 not found, replace T1/T1CE with FLAIR.

- If T2 is missing, will be replaced by FLAIR.
- If FLAIR is missing, will be replaced by T2.
- If T2 and FLAIR are missing, both are replaced with T1. If T1 not found, replace T2/FLAIR with T1CE.

## Configurations:

- **run_deepmedic_skullstripping**: Whether to run DeepMedic-based skullstripping after pre-processing (default: False)
- **run_deepmedic_tumorsegmentation**:Whether to run DeepMedic-based tumor segmentation (BraTS pretrained model) after pre-processing (default: False)

## Outputs:

- **output_name**: output description

If none, write None

## Limitations

Describe any limitations that would be useful for the user to know.

## Notes

Any development notes, any potential areas for future development
