data("ToothGrowth")
df=force(ToothGrowth)

df = ToothGrowth
print(head(df))
print(summary(df))
print(nrow(df))

library(ggplot2)
#basic jitterplot
df$dose=factor(df$dose)
p = ggplot(df, aes(x=dose, y=len)) +
  geom_violin() ; p

# Dijadikan horizontal
p + coord_flip()  

# Tidak memotong ujung violin
p = ggplot(df, aes(x=dose, y=len)) +
  geom_violin(trim=FALSE) 
p

# Hanya memilih beberapa kategori
p + scale_x_discrete(limits=c("0.5", "2")) 

# Mengubah urutan variabel kategori
p + scale_x_discrete(limits=c("2","0.5","1"))


p = ggplot(df, aes(x=dose, y=len)) + geom_violin(trim=FALSE)
p + geom_boxplot(width=0.1) +
  stat_summary(fun=mean, geom="point", size=2, color="red")


data_summary = function(x){
  m = mean(x)
  ymin = m-sd(x)
  ymax = m+sd(x)
  return (c(y=m, ymin=ymin, ymax=ymax))
}

p + stat_summary(fun.data=data_summary)
p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)

##Jittered data point
p + geom_jitter(shape=16, position=position_jitter(0.05))


# Mengubah warna garis violin plot berdasarkan kategori x
p = ggplot(df, aes(x=dose, y=len, fill=supp)) + geom_violin(trim=F) +
  labs(title="Violin plot", fill="Supplement type")

# Mengubah warna garis secara manual
p + scale_fill_manual(labels=c("Orange Juice", "Vitamin C"), values=c('#184E77','#1A759F','#34A0A4','#76C893','#B5E48C'))
#p + scale_color_manual(values=c('#184E77','#1A759F','#34A0A4','#76C893','#B5E48C'))
#p + scale_fill_manual(values=c('#184E77','#1A759F','#34A0A4','#76C893','#B5E48C'))

# Mengubah warna berdasarkan palette bawaan
#p + scale_color_brewer(palette="Dark2")


# Mengubah warna isi violin plot dengan satu warna
ggplot(df, aes(x=dose, y=len)) + 
  geom_violin(trim=F, fill="grey", color="darkred")

# Mengubah warna isi violin plot berdasarkan kategori x
p = ggplot(df, aes(x=dose, y=len, fill=dose)) + geom_violin(trim=F) #; p

# Manual
p + scale_fill_manual(values=c('#184E77','#1A759F','#34A0A4','#76C893','#B5E48C'))


p = ggplot(df, aes(x=dose, y=len, fill=supp)) + geom_violin() ; p

#posisi legenda
p + theme(legend.position = "none")
# Pilihan selain itu bisa "bottom", "none", dll



#mengubah urutan x
data = mpg
head(data)
print(nrow(data))
print(summary(data))

df = within(mpg, {
  model = factor(model)
  manufacturer = factor(manufacturer)
  year = factor(year)
  cyl = ordered(cyl)
  trans = factor(trans)
  drv = factor(drv)
  class = factor(class)
  fl = factor(fl)
})
summary(df)

# Basic
p = ggplot(df, aes(x=drv, y=cty, fill=drv)) + 
  geom_violin(width = 0.8, trim=F) #+ geom_jitter()

p

# Mengubah urutan kategori

# Pakai forcats

## diurutkan berdasarkan median setiap kategori
df %>%
  ggplot(aes(x=fct_reorder(class, hwy, .fun='median'), y=hwy, fill=class)) + 
  #ggplot( aes(x=class, y=hwy, fill=class)) +
  #geom_boxplot() +
  geom_violin() +
  xlab("class") +
  theme(legend.position="none") +
  xlab("")
# Pakai reorder()

df$class = with(mpg, reorder(class, hwy, median))

p = df %>%
  ggplot( aes(x=class, y=hwy, fill=class)) +
  geom_violin() +
  geom_boxplot(width = 0.2, alpha = 0.5) +
  xlab("class") +
  theme(legend.position="none")
p

