
<!-- README.md is generated from README.Rmd. Please edit that file -->

# WordCloudFromPapers

Welcome to ***WordCloudFromPapers***, your go-to solution for
effortlessly generating word clouds from sets of academic papers in PDF
format. This GitHub repository houses a powerful tool crafted in R,
designed to simplify the intricate process of transforming dense
research content into visually striking representations.

### Steps:

- **ETL (Extract, Transform, Load)**:

  - Seamlessly extract valuable textual data from PDF files.

  - Transform the raw data into a structured format, ready for analysis.

  - Load the processed information for subsequent tokenization.

- **Tokenization**:

  - Break down the text into individual tokens, capturing the essence of
    each word.

  - Implement advanced linguistic processing to enhance accuracy.

  - Prepare the groundwork for the final step - creating a meaningful
    word cloud.

- **Plot**:

  - Leverage the power of R to create captivating visualizations using
    the wordcloud2 package (Lang 2023).

  - Craft aesthetically pleasing word clouds that highlight the most
    prominent terms.

Why ***WordCloudFromPapers***?

**Efficiency**: Streamline your workflow with a three-step process that
takes the complexity out of text analysis.

**Flexibility**: Tailor your word clouds to meet specific requirements,
ensuring meaningful insights.

**User-Friendly**: Whether you’re a seasoned R user or a beginner, our
tool is designed to be accessible to all.

### Example

This wordcloud was generate from these papers:

- MicroRNA biogenesis machinery activation and lncRNA and REST
  overexpression as neuroprotective responses to fight inflammation in
  the hippocampus (Carvalho et al. 2023);

- Cyclopamine targeting hedgehog modulates nuclear control of the
  osteoblast activity (Costa Fernandes, Ferreira, and Zambuzzi 2023);

- Development of cobalt (Co)-doped monetites for bone regeneration
  (Almeida et al. 2023);

- Osteogenic differentiation and reconstruction of mandible defects
  using a novel resorbable membrane: An in vitro and in vivo
  experimental study (Bergamo et al. 2023);

- The Multifarious Functions of Leukotrienes in Bone Metabolism (Amadeu
  de Oliveira et al. 2023);

- Epigenetic Differences Arise in Endothelial Cells Responding to
  Cobalt–Chromium (C. Fernandes et al. 2023);

- Titanium-Enriched Medium Promotes Environment-Induced Epigenetic
  Machinery Changes in Human Endothelial Cells (Fernandes et al.
  2023);  

    

    

<figure>
<img src="wc.png" alt="Example" />
<figcaption aria-hidden="true">Example</figcaption>
</figure>

## Contribute

- Join the community and contribute to the enhancement of this tool.

- Report issues, suggest improvements, and collaborate with fellow
  enthusiasts.

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-de2023" class="csl-entry">

Almeida, Gerson Santos de, Marcel Rodrigues Ferreira, Célio Junior da
Costa Fernandes, Luísa Camilo Suter, Maria Gabriela Jacheto Carra, Diego
Rafael Nespeque Correa, Elidiane Cipriano Rangel, Margarida Juri Saeki,
and Willian Fernando Zambuzzi. 2023. “Development of Cobalt (Co)-Doped
Monetites for Bone Regeneration.” *Journal of Biomedical Materials
Research Part B: Applied Biomaterials* 112 (1).
<https://doi.org/10.1002/jbm.b.35319>.

</div>

<div id="ref-Amadeu2023" class="csl-entry">

Amadeu de Oliveira, Flávia, Cintia K. Tokuhara, Vimal Veeriah, João
Paulo Domezi, Mariana R. Santesso, Tania M. Cestari, Talita M. O.
Ventura, et al. 2023. “The Multifarious Functions of Leukotrienes in
Bone Metabolism.” *Journal of Bone and Mineral Research* 38 (8):
1135–53. <https://doi.org/10.1002/jbmr.4867>.

</div>

<div id="ref-bergamo2023" class="csl-entry">

Bergamo, Edmara T. P., Ísis de Fátima Balderrama, Marcel Rodrigues
Ferreira, Robert Spielman, Blaire V. Slavin, Andrea Torroni, Nick Tovar,
et al. 2023. “Osteogenic Differentiation and Reconstruction of Mandible
Defects Using a Novel Resorbable Membrane: An in Vitro and in Vivo
Experimental Study.” *Journal of Biomedical Materials Research Part B:
Applied Biomaterials* 111 (11): 1966–78.
<https://doi.org/10.1002/jbm.b.35299>.

</div>

<div id="ref-da2023a" class="csl-entry">

C. Fernandes, Célio Junior da, Rodrigo A. Foganholi da Silva, Gerson
Santos de Almeida, Marcel Rodrigues Ferreira, Paula Bertin de Morais,
Fábio Bezerra, and Willian F. Zambuzzi. 2023. “Epigenetic Differences
Arise in Endothelial Cells Responding to CobaltChromium.” *Journal of
Functional Biomaterials* 14 (3): 127.
<https://doi.org/10.3390/jfb14030127>.

</div>

<div id="ref-Carvalho2023" class="csl-entry">

Carvalho, Liebert Bernardes, Paula Lemes dos Santos Sanna, Camila
Cristina dos Santos Afonso, Eduardo F. Bondan, Geórgia da Silva Feltran,
Marcel Rodrigues Ferreira, Alexander Birbrair, Denise Carleto Andia,
Alexandra Latini, and Rodrigo A. Foganholi da Silva. 2023. “MicroRNA
Biogenesis Machinery Activation and lncRNA and REST Overexpression as
Neuroprotective Responses to Fight Inflammation in the Hippocampus.”
*Journal of Neuroimmunology* 382 (September): 578149.
<https://doi.org/10.1016/j.jneuroim.2023.578149>.

</div>

<div id="ref-da2023" class="csl-entry">

Costa Fernandes, Célio J. da, Marcel Rodrigues Ferreira, and Willian
Fernando Zambuzzi. 2023. “Cyclopamine Targeting Hedgehog Modulates
Nuclear Control of the Osteoblast Activity.” *Cells & Development* 174
(June): 203836. <https://doi.org/10.1016/j.cdev.2023.203836>.

</div>

<div id="ref-Fernandes2023" class="csl-entry">

Fernandes, Célio Júnior da C., Rodrigo A. Foganholi da Silva, Patrícia
F. Wood, Marcel Rodrigues Ferreira, Gerson S. de Almeida, Julia Ferreira
de Moraes, Fábio J. Bezerra, and Willian F. Zambuzzi. 2023.
“Titanium-Enriched Medium Promotes Environment-Induced Epigenetic
Machinery Changes in Human Endothelial Cells.” *Journal of Functional
Biomaterials* 14 (3): 131. <https://doi.org/10.3390/jfb14030131>.

</div>

<div id="ref-wordcloud2" class="csl-entry">

Lang, Dawei. 2023. “Wordcloud2: Create Word Cloud by htmlWidget.”
<https://github.com/lchiffon/wordcloud2>.

</div>

</div>
