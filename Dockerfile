# 1. dockerhub でベースにしたいイメージを選択 (tensorflow, pytorch, ...)
FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel

# 2. メンテナラベルの付与 "dockerhub のアカウント名 <dockerhub に登録した e-mail>"
# LABEL maintainer="SeaCrane6011 <okamotor1106@gmail.com>"

# 3. コンテナの作業場所の決定
ENV WORKSPACE /var/www
WORKDIR $WORKSPACE

# 4. Poerty のインストール
RUN pip install poetry
ENV PATH /root/.poetry/bin:$PATH

ENV DEBIAN_FRONTEND=noninteractive

# 5. 2 つのライブラリ管理ファイルをコンテナにコピー (初めて環境構築する際は, ここはコメントアウト)
COPY pyproject.toml $WORKSPACE
COPY poetry.lock $WORKSPACE

# 6. Poetry でインストールできないライブラリをインストール (任意)
# RUN pip install requirements.txt

# 7. Poetry によるライブラリの依存関係の解決 (初めて環境構築する際は, ここはコメントアウト)
RUN poetry config virtualenvs.create false && \
   pip install --upgrade pip && \
   pip install -U setuptools && \
   poetry install -n

RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y libopencv-dev 

RUN pip3 install torch==1.8.2+cu111 torchvision==0.9.2+cu111 torchaudio==0.8.2 -f https://download.pytorch.org/whl/lts/1.8/torch_lts.html

CMD ["bash"]
