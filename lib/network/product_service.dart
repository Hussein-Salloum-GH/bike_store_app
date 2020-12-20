import 'package:chopper/chopper.dart';

part 'product_service.chopper.dart';

@ChopperApi(baseUrl: "/api/customer/products")
abstract class ProductService extends ChopperService {
  @Get()
  Future<Response> getAllProducts();

  @Get(path: "?page={page}")
  Future<Response> getProductById(@Path() int page);

  @Post()
  Future<Response> createProduct(@Body() Map<String, dynamic> product);

  static ProductService instance() {
    final client = ChopperClient(
      baseUrl: "http://bikehub.store",
      services: [_$ProductService()],
      converter: JsonConverter(),
    );

    return _$ProductService(client);
  }
}
