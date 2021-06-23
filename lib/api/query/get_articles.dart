const getArticles = r'''
  query{
  allArticles{
    title
    id
    slug
    content
    hosted
    sourceUrl
    image{
      url
    }
  }
}
''';