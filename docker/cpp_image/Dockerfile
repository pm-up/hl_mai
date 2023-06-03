FROM ubuntu

ENV TZ=Europe/Moscow

RUN apt-get clean && apt-get update -y 
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata git sudo build-essential autoconf libtool libssl-dev zlib1g-dev librdkafka-dev pkg-config cmake gcc git g++ mysql-client python3 pip libmysqlclient-dev libboost-all-dev libssl-dev && apt-get clean
RUN git clone -b master https://github.com/pocoproject/poco.git && cd poco && mkdir cmake-build && cd cmake-build && cmake .. && make && sudo make install && cd .. && cd ..
RUN git clone https://github.com/redis/hiredis.git && cd hiredis && mkdir build && cd build && cmake .. && make && sudo make install && cd .. && cd .. 
RUN git clone https://github.com/sewenew/redis-plus-plus.git && cd redis-plus-plus && mkdir build && cd build && cmake .. && make && sudo make install && cd .. && cd .. 
RUN git clone https://github.com/edenhill/librdkafka.git && cd librdkafka && ./configure && make && sudo make install && cd 
RUN git clone https://github.com/mfontanini/cppkafka && cd cppkafka && mkdir build && cd build && cmake .. && make && sudo make install && cd 
RUN git clone https://github.com/pm-up/hl_mai.git code
RUN cd code/cpp && mkdir build && cd build && cmake ../ -DCMAKE_BUILD_TYPE=Release && cmake --build .

COPY run_service.sh code
RUN chmod +x code/run_service.sh

ENTRYPOINT [ "code/run_service.sh" ]
