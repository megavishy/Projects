### Problem Statement:
Consider you've just returned home after a clinical visit. You aren't clear about the medications, doctor notes, pysiotherapy and next visit summary. All you have after a long list is a After visit summary that the doctor has presented to you, which is hard to look through. To address this issue, I and my teammate have designed a UX design of an app with FAQ question for patient suffering from Postpartum Depression. 
This user case designed with the data collected from open soue UNC Health, helped us utilize a technique that NLP researchers have developed methods to automatically detect question-similarity. 

### What is question similarity?
Like other NLP tasks, question similarity involves data collection, exploratory data analysis, pre-processing, feature extraction, model training and evaluation. The idea of pre-processing data is to make it suitable for a given task and also remove unclean or wrong data. Other steps of the process might also influence the selection of pre-processing steps.

For example, if Jaccard similarity measure is used, we may do case normalization, tokenization, stopwords removal, punctuation removal, and lemmatization. Where there are many stopwords, Soft Cosine similarity will be higher if they're not removed. However, removing stopwords gives poorer results with BM25 (used in IR applications) and Translation-Based Language Model.

On short form Twitter data, Dey et al. suggested topic phrase removal, slang normalization (eg. aaf vs as a friend), named entity boundary correction (eg. Colorado Ravens and Ravens are probably the same concept), named entity tag cleaning, and synonym/hypernym replacement using WordNet (eg. quick vs fast).

Before questions can be compared, we need to represent them in a form that algorithms can efficiently process and compare. This is done after data pre-processing. The simplest techniques are TF-IDF, bag-of-words model, and n-gram model.

Since the mid-2010s, word embeddings are popular. Word embeddings are multi-dimensional vectors containing real values. Words that are similar tend to occur close to one another in the vector space. Such embeddings are learned by training on huge amounts of real-world text. GloVe and word2vec are well-known word embeddings. Contextualized word embeddings such as BERT and ELMo capture context as well.

Sentence embeddings can be learned from a weighted sum of word embeddings. By using Principal Component Analysis (PCA) and removing the projections of the average vectors on their first principal components, embeddings have shown to perform better on text similarity tasks.

Universal Sentence Encoder is another approach to sentence or question embeddings. Cer et al. have shown that transfer learning via sentence embeddings perform better than via word embeddings. Sentence-BERT used BERT to learn sentence embeddings.

In this given project, we have used BERT Model to learn the sentence and also calculate the total length of the sentence. Further, we have also performed model testing with Linear SVM, Random Forest and Logistic regression to differentiate the model parameters. This is explained in deep within the project slides attached.

### Conclusion

It was found that all the models were peforming quite similar in the same time frame, however there was a need to fine tune the parameters for better results.
