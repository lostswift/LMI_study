## 对于只包含饱和环节的系统
例如：
$$\dot{x}(t)=Ax(t)+B\sigma(Fx(t))$$
$V(x(t))=x^T(t)Px(t)$
$\dot{V}(x(t))=\dot{x}^T(t)Px(t)+x^T(t)P\dot{x}(t)$
$=2x^T(t)P[Ax(t)+B\sigma(Fx(t))]$
$=x^T(t)(PA+A^TP)x(t)+2x^T(t)PB[D_iFx(t)+D_{i-}Hx(t)]$
$=x^T(t)(P(A+BD_iF)+(A+BD_iF)^TP+PBD_{i-}H+H^TD_{i-}^TB^TP)x(t)$
$<0$
只需要
$P(A+BD_iF)+(A+BD_iF)^TP+PBD_{i-}H+H^TD_{i-}^TB^TP<0$
$(A+BD_iF)P^{-1}+P^{-1}(A+BD_iF)^T+BD_{i-}HP^{-1}+P^{-1}H^TD_{i-}^TB^T<0$
设  $Q={(\frac{P}{\rho})}^{-1}$，$G=HQ$
那么有
$ (A+BD_iF)Q+Q(A+BD_iF)^T+BD_{i-}G+G^TD_{i-}^TB^T<0$
如果我们用一个凸集合$X_R=co\{x_1,x_2,...,x_l\}$来刻画吸引域
将吸引域描述为一个椭球$x^TPx<\rho$
设$\alpha X_R$在此椭球中，并最大化$\alpha$便可逼近求解出最大化的椭球。
$(\alpha x_i)^TP(\alpha x_i)\le \rho$

$\alpha^2x_i^TPx_i\le \rho$

$\begin{bmatrix}
\frac{1}{\alpha^2}& x_i^T \\
x_i&({\frac{Q}{\rho}})^{-1}
\end{bmatrix}\ge 0$
考虑到要有$|h_ix|\le 1$恒成立
即$x^Th_i^Th_ix\le 1$恒成立
椭球$x^TPx<\rho$需要在椭球$x^Th_i^Th_ix\le 1$中
即$h_i^Th_i\le \frac{P}{\rho}$
$\begin{bmatrix}
1&h_i(\frac{P}{\rho})^{-1}\\
(\frac{P}{\rho})^-1h_i^T&(\frac{P}{\rho})^{-1}
\end{bmatrix}\ge0$

$D={\{d\in}{\bf R}^m:d_{ii}=0\ or\ 1,d_{ij}=0(i\ne j)\}$
因此，LMI方程为一下三个
* $\begin{bmatrix} \gamma& x_i^T\\x_i&Q\end{bmatrix}\ge0,i\in [1,l],$
* $(A+BD_iF)Q+Q(A+BD_iF)^T+BD_{i-}G+G^TD_{i-}^TB^T<0,\forall D_i\in D$
* $\begin{bmatrix}1 & g_i \\g_i^T & Q\end{bmatrix}\ge 0,i\in[1,m],$

##对于只有输入时滞环节的系统

$$ \dot{x}(t)=Ax(t)+BFx(t-\tau)$$
###Razumihkin方法
注意到$x(t)-x(t-\tau)=\int_{t-\tau}^t \dot{x}(\theta)\;d\theta$
设$\Sigma=P(A+BF)+(A+BF)^TP$
$A^TM_1^{-1}A<P$
$F^TB^TM_2^{-1}BF<P$
$V(x(t))=x^T(t)Px(t)$
$\dot{V}(x(t))=2x^T(t)PAx(t)+2x^T(t)P\dot{x}(t)$
$=x^T(t)(P(A+BF)+(A+BF)^TP)x(t)-2x^T(t)PBF\int_{t-\tau}^t\dot{x}(s)\;ds$
$=x^T(t)\Sigma x(t)-2x^T(t)PBF\int_{t-\tau}^tAx(s)\;ds-2x^T(t)PBF\int_{t-\tau}^tBFx(s-\tau)\;ds$
$\le x^T(t)\Sigma x(t)+\tau x^T(t)PBFM_1F^TB^TPx(t)+\frac{1}{\tau} [\int_{t-\tau}^tAx(s)\;ds]^TM_1^{-1}\int_{t-\tau}^tAx(s)\;ds$
$\quad +\tau x^T(t)PBFM_2F^TB^TPx(t)+\frac{1}{\tau} [\int_{t-\tau}^tBFx(s-\tau)\;ds]^TM_2^{-1}\int_{t-\tau}^tBFx(s-\tau)\;ds$
$\le x^T(t)(\Sigma + \tau PBF(M_1+M_2)F^TB^TP)x(t)$
$\quad +\int_{t-\tau}^t[Ax(s)]^TM_1^{-1}A(s)\;ds+\int_{t-\tau}^t[BFx(s-\tau)]^TM_2^{-1}BFx(s-\tau)\;ds$
$\le x^T(t)(\Sigma+\tau PBF(M_1+M_2)F^TB^TP)x(t)+\int_{t-\tau}^tV(x(s))\;ds+\int_{t-\tau}^tV(x(s-\tau))\;ds$
利用Razumihkin定理
$\dot{V}(x(t))<-\sigma V(x(t))\quad if \quad V(x(t+\theta))<\epsilon V(x(t))\quad \theta \in [-2\tau,0],\quad \epsilon >1,\quad  \sigma >0$
取$\epsilon=1+\beta,\beta>0$
那么$V(x(t+\theta))<(1+\beta)V(x(t))<(1+2\beta)V(x(t))$
$\dot{V}(x(t))\le x^T(t)(\Sigma + \tau PBF(M_1+M_2)F^TB^TP)x(t)+2\tau(1+2\beta)V(x(t))$
$=x^T(t)(\Sigma+\tau PBF(M_1+M_2)F^TB^TP+2\tau (1+2\beta)P)x(t)$
当
$\Sigma+\tau PBF(M_1+M_2)F^TB^TP+2\tau (1+2\beta)P<0$
有
$\Sigma+\tau PBF(M_1+M_2)F^TB^TP+2\tau (1+\beta)P<-2\tau\beta P$
因此LMI方程为：
* $Q>0$
* $\begin{bmatrix} Q &QA^T\\AQ&M_1\end{bmatrix}>0$
* $\begin{bmatrix} Q& Q(BF)^T\\BFQ&M_2\end{bmatrix}>0$
* $(A+BF)Q+Q(A+BF)^T+\tau BF(M_1+M_2)F^TB^T+2\tau Q<0$
### Krasovskii方法
$V(x(t))=x^T(t)Px(t)+\int_{t-\tau}^te^{2\alpha(s-t)}x^T(s)Sx(s)\;ds+\tau \int_{-\tau}^0\int_{t+\theta}^te^{2\alpha(s-t)}\dot{x}^T(s)R\dot{x}(s)\;ds\;d\theta$
$\dot{V}(t)+2\alpha V(t)=2x^T(t)P\dot{x}(t)+x^T(t)[S+2\alpha P]x(t)+\tau^2\dot{x}^T(t)R\dot{x}(t)-x^T(t-\tau)Se^{-2\alpha \tau}x(t-\tau)$
$\qquad \qquad \qquad \qquad -\tau e^{-2\alpha\tau}\int_{t-\tau}^t\dot{x}^T(\theta)R\dot{x}(\theta)\;d\theta$
$\qquad \qquad \qquad \quad <2x^T(t)P\dot{x}(t)+x^T(t)[S+2\alpha P]x(t)+\tau^2\dot{x}^T(t)R\dot{x}(t)-x^T(t-\tau)Se^{-2\alpha \tau}x(t-\tau)$
$\qquad \qquad \qquad \qquad -[x(t)-x(t-\tau)]^TRe^{-2\alpha\tau}[x(t)-x(t-\tau)]$
$\qquad \qquad \qquad \quad =\eta^T \Omega\eta $
其中
$\eta=\begin{bmatrix} x(t)\\\dot{x}(t)\\x(t-\tau)\end{bmatrix}$
$\Omega=\begin{bmatrix}S+2\alpha P-Re^{-2\alpha \tau}& P&Re^{-2\alpha \tau}\\*&\tau^2R&0\\*&*&-(S+R)e^{-2a\tau} \end{bmatrix}$
在利用到等式约束
$2[x^T(t)P_2+\dot{x}^T(t)P_3][Ax(t)+BFx(t-\tau)-\dot{x}(t)]=0$
$\eta^T \begin{bmatrix} P_2A+A^TP_2&-P_2+A^TP_3&P_2BF\\*&-P_3-P_3^T&P_3BF\\*&*&0\end{bmatrix}\eta=0$
最后要求
$\eta^T\Omega^*\eta<0$
$$\Omega^*=\begin{bmatrix}S+2\alpha P-Re^{-2\alpha\tau}+P_2A+A^TP_2& P-P_2+A^TP_3& Re^{-2\alpha\tau}+P_2BF\\*&\tau^2R-P_3-P_3^T&P_3BF\\*&*&-(S+R)e^{-2\alpha\tau}\end{bmatrix}$$
相关代码在[delay_krasovskii_2.m](matlab_code/delay_krasovskii_2.m)
LMI方程为：
* $P>0,$$S>0,$$R>0$
* $\begin{bmatrix}S+2\alpha P-Re^{-2\alpha\tau}+P_2A+A^TP_2& P-P_2+A^TP_3& Re^{-2\alpha\tau}+P_2BF\\*&\tau^2R-P_3-P_3^T&P_3BF\\*&*&-(S+R)e^{-2\alpha\tau}\end{bmatrix}<0$

