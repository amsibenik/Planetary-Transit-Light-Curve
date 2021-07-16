# Planetary-Transit-Light-Curve
Import .FIT files from a telescope and use it to generate a light curve for a planetary transit. FLAT and BIAS images are also imported and used to correct the telescope signal.

Notes:
* A specific naming scheme is required for all files. 1000 files were assumed for this analysis, including 10 FLAT and 10 BIAS files.
* SAOImage DS9 or equivalent program will need to be used to obtain center position of star every 20 images or so, as the star will track across the sky.
* The original data I used had missing files, so many of the commands are quite lengthy, and have a weird numbering scheme. In future, I may re-code this to be much more concise and automatically ignore missing files.
* A lot of RAM is required to run this code (Approximately 8GB). I may re-code this in future to be more efficient with RAM.

File Naming Scheme:
* FLATs:&emsp;   x.00000000.FLAT.FIT  &emsp; -> &emsp;  x.00000009.FLAT.FIT
* BIASs:&emsp;   x.00000010.BIAS.FIT  &emsp; -> &emsp;  x.00000019.BIAS.FIT
* Frames:&emsp;   x.00000020.FIT  &emsp; -> &emsp;  x.00000999.FIT
