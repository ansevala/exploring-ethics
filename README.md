# Exploring Ethics

Open Source [Robot Framework](https://robotframework.org/) library [QWeb](https://qentinel.com/qweb-open-source-automation-library/) was recently published. This repository contains an example of its usage, focusing on its Pdf reading capabilities.

To be able to run the example robot files in this repository, run command `pip install -r requirements.txt` to install the QWeb library ([source code](https://github.com/qentinelqi/qweb/)).

Then you can run:
```
robot -d output explore_ethics_0.robot
```
to see how keyword `VerifyPdfText` is failing in some cases.

You can also run:
```
robot -d output explore_ethics.robot
```
to see why they are failing, and how I overcame this problem.

Enjoy!
