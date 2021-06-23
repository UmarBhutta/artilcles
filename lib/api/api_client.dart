import 'package:graphql/client.dart';
import 'package:news_list/api/models/article.dart';
import 'package:news_list/api/query/queries.dart' as queries;
import 'package:news_list/api/resource.dart';


class ApiClient {

  const ApiClient({GraphQLClient graphQLClient})
      : assert(graphQLClient != null),
        _graphQLClient = graphQLClient;

  static var BASE_URL = 'https://graphql.datocms.com';
  factory ApiClient.create(){
    final httpLink  = HttpLink(BASE_URL);
    final authLink = AuthLink(getToken: () async => 'Bearer 5bc901b83d013770d0625e9f39ccc9');
    final connectionLink  = authLink.concat(httpLink);

    return ApiClient(graphQLClient: GraphQLClient(link:connectionLink,cache: GraphQLCache()));
  }

  final GraphQLClient _graphQLClient;

  Future<Resource<List<Article>>> getArticles() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getArticles)),
    );

    if(result.hasException){
      return Resource.error(result.exception.graphqlErrors.toString());
    }

    final data = result.data['allArticles'] as List;
    return Resource.completed(data.map((e) => Article.fromJson(e)).toList());
  }

}