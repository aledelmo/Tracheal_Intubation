# Tracheal Tubes Estimation

Prediction of correct intubation endotracheal tube diameter from age and weight.

![intro](https://i.imgur.com/MyIPYpb.jpg)

Methods for the regression of the most suited endotracheal tube diameter, based on patients age and weight. Intubation is currently
done using empiric methods and old abacus. We directly estimate the correct size, reducing the probability of re-intubation.
Independent analysis for cuff-less and cuffed tubes.

Four machine learning algorithms are tested:
1. Theil-Sen 4th degree Polynomial Regressor (LR)
2. Random Forest Regressor (RF)
3. Gradient Boosting (GB)
4. Neural Network (NN)

For each method we estimate the percentage of correct estimations, adapted estimations (smaller than ideal but
still fitting the patient) and incorrect.

Tracheal tubes size referring to the [Mallinckrodt catalogue](https://akinglobal.com.tr/uploads/subdir-141-4/covidien%20Tracheal-Tubes-Airway-Product-Catalogue.pdf).

<table>
    <tr>
        <td></td>
        <td></td>
        <td>Correct</td>
        <td>Adapted</td>
    </tr>
    <tr><td rowspan="5">Cuff-less</td></tr>
    <tr>
        <td>LR</td>
        <td>23.68 %</td>
        <td>68.42 %</td>
    </tr>
    <tr>
        <td>RF</td>
        <td>31.58 %</td>
        <td>71.05 %</td>
    </tr>
    <tr>
        <td>GB</td>
        <td>39.47 %</td>
        <td>76.32 %</td>
    </tr>
    <tr>
        <td>NN</td>
        <td>34.21 %</td>
        <td>65.79 %</td>
    </tr>
    <tr><td rowspan="5">Cuffed</td></tr>
    <tr>
        <td>LR</td>
        <td>26.32 %</td>
        <td>68.42 %</td>
    </tr>
    <tr>
        <td>RF</td>
        <td>26.32 %</td>
        <td>68.42 %</td>
    </tr>
<tr>
        <td>GB</td>
        <td>36.84 %</td>
        <td>73.68 %</td>
    </tr>
    <tr>
        <td>NN</td>
        <td>34.21 %</td>
        <td>68.42 %</td>
    </tr>
</table>

Gradient boosting is overall the best performing algorithm ( Mean Absolute Error: 1.12 mm - Maximum Residual Error: 3.62 mm )

## How to run

The notebook can be run on CPU. For GPU support use the provided Dockerfile
```shell
$ docker build --build-arg https_proxy=https://<address>:<port> -f Dockerfile --rm --tag trachealTubes .
$ docker run -u $(id -u) --gpus all -it -v $(PWD):/tf -p 8888:8888 -p 6006:6006 --rm --name tt_gpu trachealTubes:latest
```

GPU support requirements:

[Docker](https://www.docker.com) CE 20.10.3 with [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker) for GPU acceleration

## Contacts

For any inquiries please contact: 
[Alessandro Delmonte](https://aledelmo.github.io) @ [alessandro.delmonte@institutimagine.org](mailto:alessandro.delmonte@institutimagine.org)

## License

This project is licensed under the [Apache License 2.0](LICENSE) - see the [LICENSE](LICENSE) file for
details