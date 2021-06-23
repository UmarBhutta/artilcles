const getArticles = r'''
  query{
  allArticles{
    title
    id
    slug
    content
    hosted
    sourceUrl
    publisher{
      name
    }
    image{
      url
    }
  }
}
''';