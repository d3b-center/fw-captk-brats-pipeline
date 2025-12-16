import numpy as np
import nibabel as nib
import sys

def convert4Dto3D(img_path):
    nii = nib.load(img_path)
    img = np.squeeze(nii.get_fdata()[:, :, :, 0])
    nii_out = nib.Nifti1Image(img, nii.affine, nii.header)
    return nii_out


img_path = sys.argv[1]
converted_img = sys.argv[1]
try:
    new_img = convert4Dto3D(img_path)
    nib.save(new_img, converted_img)
except IndexError:
    print(f"The input image is not 4D, so no conversion required")
