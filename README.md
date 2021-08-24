# R Guide for TMLE in Medical Research

## Background 

In comparative effectiveness studies, researchers typically use propensity score methods. However, propensity score methods have known limitations in real-world scenarios, when the true data generating mechanism is unknown. **Targeted maximum likelihood estimation** (TMLE) is an alternative estimation method with a number of desirable statistical properties. It is a doubly robust method, making use of both the outcome model and propensity score model to generate an unbiased estimate as long as at least one of the models is correctly specified. TMLE also enables the integration of machine learning approaches. Despite the fact that this method has been shown to perform better than propensity score methods in a variety of scenarios, it is not widely used in medical research as the technical details of this approach are generally not well understood. 

## Goal 

In this workshop we will present an introductory tutorial explaining an overview of 

- TMLE and 
- some of the relevant methods 
  - G-computation and 
  - IPW 

using one real epidemiological data, 

- the steps to use the methods in R, and 
- a demonstration of relevant R packages. 

## Philosophy 

Code-first philosophy is adopted for this workshop; demonstrating the analyses through one real data analysis problem used in the literature. 

- This workshop is not theory-focused, nor utilizes simulated data to explain the ideas. Given the focus on implementation, theory is beyond the scope of this workshop. 
- At the end of the workshop, we will provide key references where the theories are well explained.

## Pre-requisites

- Basic understanding of *R* language is required. 
- A general understanding of *multiple regression* is expected. 
- Familiarity with *machine learning* and *epidemiological* core concepts would be helpful, but not required. 
- Deep understanding of *causal inference* or *advanced statistical inference* knowledge is not expected. 

## Version history 

The workshop was first developed for [R/Medicine
Virtual Conference](https://r-medicine.org/schedule/) 2021, August 24th; title: An Introductory R Guide for Targeted Maximum Likelihood Estimation in Medical Research.

## Contributor list 

|||
|---|---|
| [Hanna Frank](https://www.linkedin.com/in/hanna-f-940813b9/) (SPPH, UBC) | [Ehsan Karim](https://ehsank.com/) (SPPH, UBC) |  

## License 

The online version of this book is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) International License. You may share, adapt the content and may distribute your contributions under the same license (CC BY-NC-SA 4.0), but you have to give appropriate credit, and cannot use material for the commercial purposes.


## How to cite

Karim, ME and Frank, H (2021) "R Guide for TMLE in Medical Research", URL: [ehsanx.github.io/TMLEworkshop/](https://ehsanx.github.io/TMLEworkshop/), (v1.1). Zenodo. https://doi.org/10.5281/zenodo.5246085
