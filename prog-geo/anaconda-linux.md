# Instalação e Configuração do Ambiente de Programação com a Distribuição Anaconda no Linux


**1.** Baixe a distribuição Anaconda a partir da seguinte URL:

- https://www.anaconda.com/download/success


----


**2.** Supondo que você tenha baixado um arquivo com o nome semelhante a `Anaconda3-2025.12-1-Linux-x86_64.sh`, abra um terminal de comando e faça a instalação da seguinte forma:

```bash
bash Anaconda3-2025.12-1-Linux-x86_64.sh
```


O instalador da Anaconda irá apresentar várias opções da instalação, todas elas com opções padrão.


----


**3.** Após instalar a Anaconda, ative o ambiente base:

```bash
conda activate
```


----


**4.** Crie um novo ambiente e instale as bibliotecas que usaremos em aula:

```bash
conda create --name prog-geo --channel conda-forge python==3.12
```

```bash
conda activate prog-geo
```

```bash
conda install --name prog-geo --channel conda-forge numpy pandas matplotlib geopandas fiona shapely pyproj pyarrow ipyleaflet folium jupyter-lab
```


----


**5.** Ative o novo ambiente e execute o JupyterLab:

```bash
conda activate prog-geo
```


```bash
jupyter-lab
```


Pronto, você deverá ter acesso no seu navegador ao ambiente do JupyterLab!


