from concurrent import futures
import grpc
import greeting_pb2
import greeting_pb2_grpc

class Greeter(greeting_pb2_grpc.GreeterServicer):
    def SayHello(self, request, context):
        return greeting_pb2.HelloReply(message=f"Hello, {request.name}! From Python Server")

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    greeting_pb2_grpc.add_GreeterServicer_to_server(Greeter(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    print("Python gRPC server running on port 50051")
    server.wait_for_termination()

if __name__ == '__main__':
    serve() 