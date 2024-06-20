---
title: Malaria Detection using Machine Learning
author: 
date: 2024-05-20 12:00:00 +0900
categories: [Projects, Machine Learning]
tags: [Android, Kotlin, Java, Mobile App]
render_with_liquid: false
---

## Technologies
Python, TensorFlow, Keras, Scikit-learn

## Description
This project focused on developing machine learning models to classify parasitized and uninfected cells in the malaria dataset. The project was divided into three phases: data selection, model training, fine-tuning, and performance evaluation. Below is the final report that I wrote for the project.

## Introduction
This report presents the collaborative efforts of our Applied Machine Learning Team Project,
with a specific emphasis on the malaria dataset comprising blood smear images. The dataset
consists of approximately 27,558 images, offering a balanced representation of cells infected
with parasites and uninfected cells, thus providing an ideal challenge for developing advanced
image classification models. Our project aims to apply various machine learning algorithms to
the malaria dataset and improve model performance through data preprocessing and
hyperparameter fine-tuning.

We structured our project into three distinct phases. In Phase 1, we focused on dataset selection,
implementing three initial models, and assessing their performance. Phase 2 involved selecting
two initial models for further refinement, modifying their architectures, and adjusting
hyperparameters to enhance performance. During Phase 3, we concentrated on conducting
additional fine-tuning tests and synthesizing our findings to create a final presentation
summarizing our research journey and the practical implications of our work.

## Data Analysis and Pre-Processing

### 1) Dataset Overview
The malaria dataset is essential for automating the detection of parasitic infections through image
analysis. It comprises thin blood smear slide images categorized as either 'Parasitized' or
'Uninfected.' This dataset, obtained from a public repository, consists of roughly 27,558 images,
offering a wealth of data for developing machine learning applications in medical diagnostics.

![malaria](assets/img/post_images/2024-05-20-malaria-detection-using-machine-learning/malaria.png)
_Malaria Dataset_

### 2) Statistical Analysis
We performed a thorough statistical analysis to understand the dataset's characteristics better. We
calculated various metrics, such as mean pixel values and pixel value standard deviations, to gain
insights into the data distribution within the images. This analysis revealed valuable information
about the image characteristics, including the contrast between parasitized and uninfected cells.
These findings informed our subsequent preprocessing steps and model selection.

![statistical analysis](assets/img/post_images/2024-05-20-malaria-detection-using-machine-learning/statistic analysis.png)

The distribution of mean pixel values in the dataset was between 60 and 160, with a peak around
130, suggesting that most images have similar brightness levels. The distribution of pixel value standard deviations ranged from 60 to 90, with a peak near 75, indicating that the majority of
images have comparable levels of pixel value variability or contrast.

These findings influenced our preprocessing steps in several ways. The relatively narrow range
of mean pixel values allowed us to use a simple normalization technique, such as Min-Max
scaling, to standardize the brightness levels across images, streamlining our preprocessing
pipeline. Additionally, the concentrated distribution of pixel value standard deviations suggested
that the visual differences between infected and uninfected cells might be subtle. To address this,
we employed data augmentation techniques like rotations and flips to introduce more variability
into our training data, helping to prevent overfitting and improve the generalization ability of our
models.

The statistical analysis also provided valuable insights for model selection. The similarity in
brightness and contrast levels among images hinted that the distinguishing features between
infected and uninfected cells could lie in the local patterns and textures within the images. This
led us to choose Convolutional Neural Networks (CNNs) as our primary model architecture, as
they are particularly well-suited for capturing intricate details and subtle changes within the cells
through convolutional layers, enabling effective classification of cell infection status. In addition
to CNNs, we also decided to implement and test various other models learned in this course,
including KNN and an ensemble model combining CNN and Decision Tree, to explore their
performance on our dataset.

### 3) Preprocessing Steps
The preprocessing of the dataset involved several steps to ensure the data was conducive to
practical model training:

- **Image Normalization**: Each image's pixel values were scaled from 0 to 1. This normalization
process was crucial for reducing computational complexity and improving the model's
convergence speed during training. By standardizing the pixel values across all images, we
ensured that the models could focus on learning the relevant patterns and features without being
influenced by variations in image brightness or scale.

- **Data Augmentation**: Augmentation techniques were employed to enhance the model's
generalization capabilities and prevent overfitting. These techniques included rotations, flips,
zooms, and shifts, which artificially increased the diversity of the training data without requiring
additional original images.

- **Data Splitting**: The dataset was divided into training and validation sets, with 70% of the data
allocated for training and 30% reserved for validation. This split was critical for evaluating the model's performance and fine-tuning its hyperparameters without compromising its ability to
generalize to new, unseen data.

## Model Structure
Building upon the insights gathered from our data analysis and preprocessing steps, we carefully
selected and refined our machine learning models to effectively classify parasitized and
uninfected cells in the malaria dataset. Our model selection process was divided into three
phases, each focusing on different model development and optimization aspects.

### 1) Initial Model Selection in Phase 1
In the first phase of our project, we implemented three distinct machine-learning models to
explore their performance on the malaria dataset:

**Convolutional Neural Network (CNN)**: We chose a CNN as our primary model due to its
proven effectiveness in image recognition tasks. The CNN architecture consisted of
convolutional layers to capture spatial hierarchies of features, pooling layers to reduce
dimensionality, and fully connected layers for classification. The decision to use a CNN was
based on its ability to automatically learn and extract relevant features from the images, which is
particularly useful given the subtle visual differences between parasitized and uninfected cells, as
revealed by our statistical analysis.

**K-Nearest Neighbors (KNN)**: We also implemented a KNN classifier to compare the CNN's
performance with a simpler model. KNN classifies images based on the majority vote of their k
nearest neighbors in the feature space. While KNN is known for its simplicity and efficiency in
many classification tasks, it might struggle to capture the complex patterns in the malaria dataset,
as suggested by the concentrated distributions of pixel values and standard deviations.

**Ensemble Model (CNN and Decision Tree)**: To potentially leverage the strengths of different
model architectures, we created an ensemble model combining a CNN and a Decision Tree
classifier. The rationale behind this choice was to investigate whether CNN's ability to learn local
patterns and the Decision Tree's global feature analysis could complement each other and
improve overall performance. We implemented the ensemble using a soft voting technique,
which averages the prediction probabilities from both models to determine the final class label.

### 2) Model Refinement in Phase 2
Based on the results and insights from Phase 1, we selected the CNN and the Ensemble model
for further refinement in Phase 2. Our goal was to optimize these models by fine-tuning
hyperparameters, modifying architectures, and exploring advanced ensemble techniques:

**Enhanced CNN (VGG)**: To improve CNN's performance, we transitioned to a more complex
VGG architecture, which incorporates multiple convolutional and pooling layers to capture more
nuanced patterns in the images. This decision was motivated by CNN's promising initial results
and the potential of deeper networks to distinguish the subtle differences between parasitized and
uninfected cells, as indicated by our statistical analysis.

**Ensemble Model (CNN, Random Forest, and SVM)**: We refined the ensemble model by
replacing the Decision Tree with a combination of Random Forest and Support Vector Machine
(SVM) classifiers. The Random Forest was chosen for its ability to handle high-dimensional data
and reduce overfitting, while the SVM was selected for its robustness in classification tasks.
Additionally, we shifted from soft voting to a stacking approach, where a meta-learner is trained
on the predictions of the base models to make the final classification decision. This modification
aimed to capture more complex relationships between the models' outputs and improve the
ensemble's overall performance.

### 3) Model Refinement in Phase 3
In our project's third and final phase, we focused on further fine-tuning our models based on the
results and insights from Phase 2. Our primary goal was to explore additional techniques to
enhance the performance of our VGG and ensemble models.

For the VGG model, we experimented with various hyperparameter adjustments, such as
modifying the learning rate, batch size, and number of epochs. However, despite these efforts,
we observed minimal improvements in the VGG model's performance compared to Phase 2.

Similarly, for the ensemble model, we explored integrating additional machine learning
algorithms, such as Gradient Boosting, to further enhance its predictive power. We also
experimented with different stacking configurations and meta-learning algorithms to optimize
the combination of base models. Despite these attempts, the ensemble model's performance was
similar to the results obtained in Phase 2.

## Results and Model Comparison
Having developed and refined our machine learning models across three phases, we now
comprehensively analyze their performance and compare their results. This section will detail the
evaluation metrics for each model, discuss the improvements achieved through model
refinement, and provide a final assessment of our models' effectiveness in classifying parasitized
and uninfected cells in the malaria dataset.

### 1) Phase 1 Results and Comparison
In Phase 1, we implemented three initial models - a CNN, KNN, and an Ensemble of CNN and
Decision Tree - and evaluated their performance using various metrics, including accuracy,
precision, recall, and F1-score.

**Model #1 (CNN)**: The CNN demonstrated strong performance in Phase 1, achieving an accuracy
of 95.46%, precision of 94.73%, recall of 96.27%, and an F1-score of 95.49%. These results
validated our choice of using a CNN for this image classification task and confirmed its ability to
learn and extract relevant features from the malaria dataset effectively.

**Model #2 (KNN)**: As anticipated based on our statistical analysis, the KNN classifier struggled
to capture the complex patterns in the malaria dataset, resulting in lower performance compared
to the CNN. It achieved an accuracy, precision, recall, and F1-score of 62%. While
computationally efficient, the KNN's simplicity was a limitation in this context.

**Model #3 (Ensemble of CNN and Decision Tree)**: The ensemble model, combining a CNN and
Decision Tree, aimed to leverage the strengths of both models. It achieved an accuracy of
84.52%, a precision of 94.50%, a recall of 73.28%, and an F1-score of 82.55%. Although the
ensemble showed promising results, the lower recall indicated room for improvement in
detecting all positive cases.

![Phase1_Model_Comparison](assets/img/post_images/2024-05-20-malaria-detection-using-machine-learning/phase1 model comparison.png)

### 2) Phase 2 Results and Comparison
Building upon the insights from Phase 1, we refined our models in Phase 2 by enhancing the
CNN architecture and exploring more advanced ensemble techniques.

**Model #1 (VGG)**: The transition from a basic CNN to the VGG architecture yielded significant
performance improvements. The VGG model achieved an accuracy of 97.39%, a precision of
95.52%, a recall of 97.52%, and an F1-score of 95.48%. These results demonstrated the benefits
of using a deeper network to capture more intricate patterns in the malaria dataset, as suggested
by our statistical analysis.

**Model #2 (Ensemble of CNN, RF, SVM)**: By incorporating Random Forest and SVM
classifiers into the ensemble and adopting a stacking approach, we observed notable
enhancements in the model's performance. The refined ensemble achieved an accuracy of
92.86%, a precision of 91.70%, a recall of 94.23%, and an F1-score of 92.95%. This
improvement highlighted the effectiveness of combining diverse models and using more
sophisticated ensemble techniques to make accurate predictions.

**Comparison with Pre-Existing Model (MobileNet)**: To benchmark our models' performance,
we compared them against MobileNet, a well-established efficient model. While MobileNet
achieved an accuracy of 91.35%, precision of 88.46%, and recall of 95.08%, our VGG and
refined ensemble models outperformed it in terms of precision and accuracy, validating the
effectiveness of our model selection and refinement process.

![Phase2_Model_Comparison](assets/img/post_images/2024-05-20-malaria-detection-using-machine-learning/phase2 model comparison.png)

**Training and Inference Time**: The VGG model required a considerable amount of training
time, approximately 1246 seconds, with an inference time of 759 seconds, due to the
computational demands of its deep neural network architecture. The ensemble model, on the
other hand, had a training time of 633 seconds, and its inference time was the shortest among the
three models, at 41 seconds. Although the ensemble model showed lower performance metrics
such as accuracy, it demonstrated advantages in training and inference times, highlighting its
efficiency.

![Phase2_Time_Comparison](assets/img/post_images/2024-05-20-malaria-detection-using-machine-learning/Phase2 Time Comparison.png)

### 3) Final Results
The progression from Phase 1 to Phase 2 demonstrated significant improvements in our models'
performance, showcasing the impact of our refinement strategies. The VGG model, in particular,
exhibited remarkable enhancements across all evaluation metrics, with accuracy increasing from
95.46% to 97.39%, precision from 94.73% to 95.52%, recall from 96.27% to 97.52%, and
F1-score from 95.49% to 95.48%. These results highlight the VGG model's superior ability to
analyze and classify complex image features in the malaria dataset.

Similarly, the refined ensemble model (CNN, RF, SVM) showed substantial improvements, with
accuracy increasing from 84.52% to 92.86%, precision from 94.50% to 91.70%, recall from
73.28% to 94.23%, and F1-score from 82.55% to 92.95%. The integration of RF and SVM
classifiers enhanced the model's robustness and reduced false negatives, which is crucial in
medical diagnostic applications.

![improvements](assets/img/post_images/2024-05-20-malaria-detection-using-machine-learning/improvements.png)

## Conclusion
### 1) Summary of Key Findings and Learnings
Throughout this project, we explored applied machine-learning techniques to classify parasitized
and uninfected cells in the malaria dataset. Our journey yielded several key findings and valuable
learnings:

Firstly, the statistical analysis of the dataset provided crucial insights into the image
characteristics, guiding our preprocessing steps and model selection process. The relatively
narrow distribution of mean pixel values and standard deviations suggested the need for simple
normalization techniques and highlighted the potential challenges in distinguishing between
infected and uninfected cells.

Secondly, our iterative model selection and refinement process demonstrated the importance of
matching model complexity to the task at hand. The superior performance of the VGG model,
with its deep architecture, showcased the effectiveness of convolutional neural networks (CNNs)
in capturing intricate patterns and subtle differences in the malaria dataset. This finding
underscores the remarkable capacity of CNNs for image-based classification tasks.

Moreover, the development and refinement of the ensemble models revealed the potential of
combining diverse classifiers to improve prediction reliability. The integration of Random Forest
and Support Vector Machine classifiers into the ensemble, along with the adoption of a stacking
approach, resulted in enhanced robustness and reduced false negatives.

### 2) Potential Improvements and Future Research Directions
While our project achieved significant milestones, several avenues remain for further
enhancement and exploration. One promising direction is to expand the scope of data
augmentation techniques and incorporate higher-quality images into our training pipeline. By
applying advanced augmentation methods, such as elastic transformations, random cropping, and
color jittering, we can simulate a broader range of variations in the dataset, potentially improving
model generalization and robustness to real-world scenarios. These techniques can help our
models learn more diverse representations of the malaria-infected cells and adapt to the
challenges posed by variations in image quality and acquisition conditions.

Another exciting avenue for future research is the investigation of advanced architectures,
particularly Vision Transformers (ViT). ViTs have recently gained significant attention in the
computer vision community due to their ability to capture long-range dependencies and global
context in image data. By leveraging the self-attention mechanism, ViTs can effectively model
the relationships between different regions of an image, potentially uncovering subtle patterns
and discriminative features that may be overlooked by traditional convolutional architectures.

Incorporating ViTs into our model selection process could offer new perspectives on analyzing
the malaria dataset and improve our models' ability to classify parasitized and uninfected cells
accurately. Furthermore, exploring more advanced ensemble techniques, such as boosting or
more sophisticated stacking approaches, could enhance the performance of our ensemble models,
allowing them to leverage the strengths of individual classifiers better and make more accurate
predictions.

## References
- TensorFlow. (2023). TensorFlow Documentation: Image Classification.
https://www.tensorflow.org/tutorials/images/classification
- Keras. (2023). Keras Applications. https://keras.io/api/applications/
- Malaria Dataset (TFDS): https://www.tensorflow.org/datasets/catalog/malaria
- MobileNet (tf.keras.applications.MobileNet):
https://www.tensorflow.org/api_docs/python/tf/keras/applications/MobileNet