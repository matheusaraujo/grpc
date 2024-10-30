const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');

const PROTO_PATH = '../protos/greeting.proto';

const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
    keepCase: true,
    longs: String,
    enums: String,
    defaults: true,
    oneofs: true
});

const greeting_proto = grpc.loadPackageDefinition(packageDefinition).greeting;

function main() {
    const client = new greeting_proto.Greeter(
        'localhost:50051',
        grpc.credentials.createInsecure()
    );

    client.sayHello({ name: 'World' }, (error, response) => {
        if (error) {
            console.error('Error:', error);
            return;
        }
        console.log('Greeting:', response.message);
    });
}

main(); 