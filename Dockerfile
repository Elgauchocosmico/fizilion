# inherit prebuilt image
FROM docker.pkg.github.com/frost2k5/fizilion-docker/image:latest

# env setup
RUN mkdir /Fizilion && chmod 777 /Fizilion
ENV PATH="/Fizilion/bin:$PATH"
WORKDIR /Fizilion

# clone repo
RUN git clone https://github.com/FrosT2k5/ProjectFizilion -b dragon /Fizilion


# Copies session and config(if it exists)
COPY ./sample_config.env ./userbot.session* ./config.env* /Fizilion/

#transfer
RUN curl -sL https://git.io/file-transfer | sh

# install required pypi modules
RUN pip3 install -r requirements.txt

RUN apk add expect
# Finalization
CMD ["python3","-m","userbot"]
