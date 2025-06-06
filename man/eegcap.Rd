\name{eegcap}
\alias{eegcap}
\title{
Draws EEG Cap with Selected Electrodes
}
\description{
Creates two- or three-dimensional plot of electroencephalography (EEG) cap with user-input electrodes. Three-dimensional plots are created using the \code{\link{eegcoord}} data and the \code{\link[rgl]{plot3d}} function (from \code{rgl} package). Currently supports 84 scalp electrodes, and plots according to the international 10-10 system. Includes customization options (e.g., each electrode can have a unique plotting color, size, label color, etc.).
}
\usage{
eegcap(electrodes = "10-10", type = c("2d", "3d"),
       plotlabels = TRUE, plotaxes = FALSE, main = "",
       xyzlab = NULL, cex.point = NULL, col.point = NULL,
       col.border = NULL, cex.label = NULL, col.label = NULL, 
       nose = TRUE, ears = TRUE, head = TRUE, 
       col.head = "AntiqueWhite", index = FALSE, 
       plt = c(0.03,0.97,0.03,0.97), ...)
}
\arguments{
  \item{electrodes}{
Character vector with electrodes to plot. Each element of \code{electrodes} must match one of the 89 reference electrodes (see Notes). Mismatches are ignored (not plotted). Input is NOT case sensitive. Default plots all available electrodes (full 10-10 system).
}
  \item{type}{
Type of plot to create: \code{type="3d"} produces three-dimensional plot, whereas \code{type="2d"} produces two-dimensional projection plot (bird's eye view).
}
  \item{plotlabels}{
If \code{TRUE}, the electrode labels are plotted.
}
  \item{plotaxes}{
If \code{TRUE}, the axes are plotted.
}
  \item{main}{
Title to use for plot. Default is no title
}
    \item{xyzlab}{
Axis labels to use for plot. If \code{type="2d"}, then \code{xyzlab} should be two-element character vector giving x and y axis labels. If \code{type="3d"}, then \code{xyzlab} should be three-element character vector giving x, y, and z axis labels.
}
  \item{cex.point}{
Size of electrode points. Can have a unique size for each electrode.
}
  \item{col.point}{
Color of electrode points. Can have a unique color for each electrode.
}
  \item{col.border}{
Color of electrode point borders. Can have a unique color for each electrode.  
}
  \item{cex.label}{
Size of electrode labels. Can have a unique size for each electrode label. Input is ignored if \code{plotlabels=FALSE} is used.  
}
  \item{col.label}{
Color of electrode labels. Can have a unique color for each electrode label. Input is ignored if \code{plotlabels=FALSE} is used.
}
  \item{nose}{
If \code{TRUE}, triangle is plotted to represent the subject's nose. Ignored if \code{type="3d"}.
}
  \item{ears}{
If \code{TRUE}, ovals are plotted to represent the subject's ears. Ignored if \code{type="3d"}.
}
  \item{head}{
If \code{TRUE}, head is plotted. Ignored if \code{type="2d"}.
}
  \item{col.head}{
Color for dummy head in 3d plot. Ignored if \code{type="2d"}.
}
  \item{index}{
Logical indicating if the cap row indices should be returned (see Note).
}
  \item{plt}{
A vector of the form c(x1, x2, y1, y2) giving the coordinates of the plot region as fractions of the current figure region. See \code{\link{par}}.
}
  \item{...}{
  Optional inputs for \code{plot} or \code{plot3d} function.
}

}
\value{
Produces plot of EEG cap and possibly returns cap row indices.
}
\references{
  Murdoch, D., and Adler, D. (2025). \emph{rgl: 3D Visualization Using OpenGL}. \doi{10.32614/CRAN.package.rgl}, R package version 1.3.18, http://CRAN.R-project.org/package=rgl
  
  Oostenveld, R., and Praamstra, P. (2001). The Five percent electrode system for high-resolution EEG and ERP measurements. \emph{Clinical Neurophysiology, 112}, 713-719. \doi{10.1016/S1388-2457(00)00527-7}
}
\author{
Nathaniel E. Helwig <helwig@umn.edu>
}
\note{
Currently supports 84 scalp electrodes (plus ears and nose):
A1   A2   AF1  AF2  AF3  AF4  AF5  AF6  AF7  AF8  AFZ  C1   C2   C3   C4   
C5   C6   CP1  CP2  CP3  CP4  CP5  CP6  CPZ  CZ   F1   F2   F3   F4   F5   
F6   F7   F8   F9   F10  FC1  FC2  FC3  FC4  FC5  FC6  FCZ  FP1  FP2  FPZ  
FT7  FT8  FT9  FT10 FZ   I1   I2   IZ   NZ   O1   O2   OZ   P1   P2   P3   
P4   P5   P6   P7   P8   P9   P10  PO1  PO2  PO3  PO4  PO5  PO6  PO7  PO8  
PO9  PO10 POZ  PZ   T7   T8   T9   T10  TP7  TP8  TP9  TP10

See \code{\link{eegcoord}} for the coordinates used to create plot. Setting \code{index=TRUE} returns the row indices of \code{\link{eegcoord}} that were used to plot the cap.

To save three-dimensional plots, use the \code{\link[rgl]{rgl.postscript}} function (from \code{rgl} package).
}

\examples{
##########   EXAMPLE 1   ##########

# plot 10-10 system (default):

# plot full cap 2d (default options)
eegcap()

# plot full cap 2d (different color for ears and nose)
data(eegcoord)
mycols <- rep("white",87)
enames <- rownames(eegcoord)
mycols[enames=="A1"] <- "green"
mycols[enames=="A2"] <- "light blue"
mycols[enames=="NZ"] <- "pink"
eegcap(col.point = mycols)



##########   EXAMPLE 2   ##########

# plot 10-20 system:

# plot 2d cap with labels
eegcap("10-20")

# plot 2d cap without labels
eegcap("10-20", plotlabels = FALSE)



##########   EXAMPLE 3   ##########

# plot custom subset of electrodes
myelectrodes <- c("FP1","FP2","FPZ","F7","F3","FZ",
                  "F4","F8","T7","C3","CZ","C4","T8",
                  "P7","P3","PZ","P4","P8","O1","O2")
eegcap(myelectrodes)

}
