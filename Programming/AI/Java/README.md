# Java for AI and ML
© Ioannis Kostaras

---

## Introduction
When someone wants to learn Artificial Intelligence (AI) and Machine Learning (ML), there is one mainstream language taught everywhere, [Python](https://www.python.org) (and maybe [R](https://www.r-project.org)). However, other languages also offer significant libraries for AI/ML development. In this series of articles we will see what Java offers and compare it to Python.

## Some Definitions

* **Machine learning (ML)** is the field of study that gives computers the ability to learn without being explicitly programmed.
  * E.g. a model / algorithm that allows, from an image, to recognize/predict if there is a stop sign in it.
* **Artificial Intelligence (AI)**: once we are able to recognize a stop signal, it will be necessary to make the decision to stop or not, when to do it, how to do it, etc.
* **Data Science**: before building out our model / algorithm, we will have to understand the data we have to train it. Once trained, we will have to be able to evaluate the obtained results and detect in the data any anomaly that may affect model performance.

## Java vs Python for AI/ML

| Typical Use Case / Notes                  | Python Library                                                                                         | Java Equivalent(s)                                                                                                                                                                                                                                |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Numerical computations, matrix operations | [NumPy](https://numpy.org/)                                                                            | [ND4J](https://deeplearning4j.konduit.ai/nd4j/tutorials), [Apache Commons Math](https://commons.apache.org/proper/commons-math/)                                                                                                                  |
| Data manipulation and analysis            | [Pandas](https://pandas.pydata.org/)                                                                   | [Tablesaw](https://jtablesaw.github.io/tablesaw/gettingstarted.html), [Apache Arrow](https://arrow.apache.org/), [dflib](https://dflib.org/)                                                                                                      |
| Classical machine learning algorithms     | [scikit-learn](https://scikit-learn.org/stable/), [SciPy](https://scipy.org/)                          | [Smile](https://haifengl.github.io/), [Weka](https://ml.cms.waikato.ac.nz/weka/), [Tribuo](https://tribuo.org/), [Deeplearning4j](https://deeplearning4j.konduit.ai/), [JavaML](https://github.com/AbeelLab/javaml)                               |
| Deep learning, neural networks            | [TensorFlow](https://www.tensorflow.org/), [PyTorch](https://pytorch.org/), [Keras](https://keras.io/) | [TensorFlow Java API](https://www.tensorflow.org/jvm/install), [Deeplearning4j](https://deeplearning4j.konduit.ai/), [DJL](https://djl.ai/), [Tribuo](https://tribuo.org/), [DeepNets](https://www.deepnetts.com/)                                |
| Data visualization/charting               | [Matplotlib](https://matplotlib.org/)/[Seaborn](https://seaborn.pydata.org/)                           | [JFreeChart](https://www.jfree.org/jfreechart/), [XChart](https://github.com/knowm/XChart), [Fair-acc/Charts-FX](https://github.com/fair-acc/chart-fx)                                                                                            |
| Natural language processing               | [NLTK](https://www.nltk.org/)/[spaCy](https://spacy.io/)                                               | [Apache OpenNLP](https://opennlp.apache.org/), [Stanford NLP](https://nlp.stanford.edu/), [Mallet](https://mimno.github.io/Mallet/)                                                                                                               |
| [Documentation](Documentation/README.md)                             | [Jupyter](https://jupyter.org/)                                                                        | Java plugins for Jupyter: [IJava](https://github.com/SpencerPark/IJava)/[JJava](https://github.com/dflib/jjava) ([more info](https://github.com/jupyter-java)), [JTaccuino](https://github.com/jtaccuino/jtaccuino); a JavaFX standalone solution |

