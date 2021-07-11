This folder contains outputs from MaAsLin2. The association analysis was run for digesta and mucosa samples, respectively. Each folder contains the following files:

1. Data output files
    * ``all_results.tsv``
        * This includes the same data as the data.frame returned.
        * This file contains all results ordered by increasing *q*-value.
        * The first two columns are feature names and metadata.
        * The next two columns are the value (``value``) and coefficient (``coef``) from the model.
        * The next column, ``stderr``, is the standard deviation from the model.
        * The ``N`` column is the total number of data points.
        * The ``N.not.zero`` column is the total of non-zero data points.
        * The ``pvalue`` from the calculation is the second to last column.
        * The ``qvalue`` is computed with `p.adjust` with the correction method.
    * ``significant_results.tsv``
        * This file is a subset of the results in the first file.
        * It only includes associations with *q*-value <= 0.1.
2. Visualization output files
    * ``heatmap.pdf``
        * This file contains a heatmap of the significant associations.
    * ``[a-z/0-9]+.pdf``
        * A plot is generated for each significant association.
        * Scatter plots are used for continuous metadata.
        * Box plots are for categorical data.
        * Data points plotted are after normalization, filtering, and transform.

    
