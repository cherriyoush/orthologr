% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/substitutionrate.R
\name{substitutionrate}
\alias{substitutionrate}
\title{Internal function for dNdS computations}
\usage{
substitutionrate(file, est.method, format = "fasta", quiet = FALSE,
  kaks_calc.params = NULL, kaks_calc_path = NULL, subst_name = NULL)
}
\arguments{
\item{file}{a character string specifying the path to a codon alignment file}

\item{est.method}{a character string specifying the dNdS estimation method, e.g. "Comeron","Li" .
Note, that when using "Comeron" as dNdS estimation method, the program 'gestimator' is used to compute the
corresponding dNdS values from a given alignment. The program 'gestimator' can only read "fasta" files,
hence it is important to use format = "fasta" when choosing est.method = "Comeron".}

\item{format}{a character string specifying the file format in which the alignment is stored:
"mase", "clustal", "phylip", "fasta" , "msf"}

\item{quiet}{a logical value specifying whether the output of the coresponding interface shall be printed out.}

\item{kaks_calc.params}{a character string storing additional parameters for KaKs_Claculator 1.2 . Default is \code{NULL}. Example:
\code{kaks_calc.params} = "-m NG -m YN".}

\item{kaks_calc_path}{a character string specifying the execution path to KaKs_Calculator. Default is \code{kaks_calc_path} = \code{NULL}
(meaning that KaKs_Calculator is stored and executable in your default \code{PATH}).}

\item{subst_name}{a character string specifying the substitution name that shall be added to the internal folder path naming. 
Default is \code{subst_name} = \code{NULL}.}
}
\value{
A data.table storing the query_id, subject_id, dN, dS, and dNdS values or 
a data.table storing the query_id, method, dN, dS, and dNdS values when using KaKs_Calculator.
If the dNdS value cannot be calculated NA is returned. This can happen because of constraints
of the used model. As each program throws different exception values we set all of them to NA instead.
}
\description{
This function takes a pairwise alignment as input file and estimates the
dNdS ratio of the corresponding alignment. Nevertheless, this function is a helper function for
\code{\link{dNdS}}. For dNdS computations you should use the function: \code{\link{dNdS}}.
}
\details{
This function takes a pairwise alignments file as input and estimates dNdS ratios
of the corresponding alignments using predefined dNdS estimation methods.

The dNdS estimation methods available in this function are:

\itemize{
\item "Li" : Li's method (1993) -> provided by the ape package

\item "Comeron" : Comeron's method (1995)
}
dNdS estimation methods provided by KaKs_Calculator 1.2 :

Approximate Methods:

\itemize{
\item "NG": Nei, M. and Gojobori, T. (1986)

\item "LWL": Li, W.H., et al. (1985)

\item "LPB": Li, W.H. (1993) and Pamilo, P. and Bianchi, N.O. (1993)

\item "MLWL" (Modified LWL), MLPB (Modified LPB): Tzeng, Y.H., et al. (2004)

\item "YN": Yang, Z. and Nielsen, R. (2000)

\item "MYN" (Modified YN): Zhang, Z., et al. (2006)

}

Maximum-Likelihood Methods:
\itemize{
\item GY: Goldman, N. and Yang, Z. (1994)
}
}
\examples{
\dontrun{

# estimate the dNdS rate using Li's method
substitutionrate(
   file       = system.file("seqs/pal2nal.aln", package = "orthologr"),
   est.method = "Li", 
   format     = "fasta")
 
# estimate the dNdS rate using Comeron's method
substitutionrate(
   file       = system.file("seqs/pal2nal.aln", package = "orthologr"),
   est.method = "Comeron", 
   format     = "fasta")
                 
# estimate the dNdS rate using model averaging provided by
# the KaKs_Calculator 1.2 program
 substitutionrate(
    file       = system.file("seqs/pal2nal.aln", package = "orthologr"), 
    est.method = "MA", 
    format     = "fasta") 
                  
 # estimate the dNdS rate using Nei and Gojobori's method provided by the 
 # KaKs_Calculator 1.2 program
 substitutionrate(
    file       = system.file("seqs/pal2nal.aln", package = "orthologr"), 
    est.method = "NG", 
    format     = "fasta")     
  
  # estimate the dNdS rate using Nei and Gojobori's method AND Yang and Nielsen's 
  # method provided by the KaKs_Calculator 1.2 program 
  # for this purpose we choose: 
  # est.method = "kaks_calc" and kaks_calc.params = "-m NG -m YN"                 
 substitutionrate(
   file             = system.file("seqs/pal2nal.aln", package = "orthologr"),
   est.method       = "kaks_calc", 
   format           = "fasta",
   kaks_calc.params = "-m NG -m YN")
                  
                                          
}
}
\author{
Hajk-Georg Drost and Sarah Scharfenberg
}
\references{
Li, W.-H. (1993) Unbiased estimation of the rates of synonymous and nonsynonymous substitution. J. Mol. Evol., 36:96-99.

Charif, D. and Lobry, J.R. (2007) SeqinR 1.0-2: a contributed package to the R project for statistical computing devoted to biological sequences retrieval and analysis.

Thornton, K. (2003) libsequence: a C++ class library for evolutionary genetic analysis. Bioinformatics 19(17): 2325-2327

Zhang Z, Li J, Zhao XQ, Wang J, Wong GK, Yu J: KaKs Calculator:
Calculating Ka and Ks through model selection and model averaging. Genomics Proteomics Bioinformatics 2006 , 4:259-263.

https://code.google.com/p/kaks-calculator/wiki/KaKs_Calculator

https://code.google.com/p/kaks-calculator/wiki/AXT
}
\seealso{
\code{\link{dNdS}}, \code{\link{multi_aln}}, \code{\link{codon_aln}}, \code{\link{blast_best}},
\code{\link{blast_rec}}, \code{\link{read.cds}}
}

