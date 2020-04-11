FROM masipcat/wireguard-go:latest

# USAGE INSTRUCTIONS
# docker run -it -v "$(pwd)/configs:/configurator/configs" quacktacular/wireguard-mesh-configurator

# Install binary requirements to run mesh tool
RUN apk add git python3

# Install Python module to run mesh tool
RUN pip3 install avalon_framework

# Install mesh configuration tool
RUN git clone https://github.com/k4yt3x/wireguard-mesh-configurator.git /configurator

# Set the path so our volume works
RUN mkdir /configurator/configs
WORKDIR /configurator/configs

ENTRYPOINT ["/configurator/wireguard_mesh_configurator.py", "interactive"]
