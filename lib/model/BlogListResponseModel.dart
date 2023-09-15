import 'dart:convert';
/// success : 1
/// message : ""
/// total : 203
/// category : null

BlogListResponseModel blogListResponseModelFromJson(String str) => BlogListResponseModel.fromJson(json.decode(str));
String blogListResponseModelToJson(BlogListResponseModel data) => json.encode(data.toJson());
class BlogListResponseModel {
  BlogListResponseModel({
      List<ItemBlogs>? itemBlogs, 
      num? success, 
      String? message, 
      num? total, 
      dynamic category,}){
    _itemBlogs = itemBlogs;
    _success = success;
    _message = message;
    _total = total;
    _category = category;
}

  BlogListResponseModel.fromJson(dynamic json) {
    if (json['list'] != null) {
      _itemBlogs = [];
      json['list'].forEach((v) {
        _itemBlogs?.add(ItemBlogs.fromJson(v));
      });
    }
    _success = json['success'];
    _message = json['message'];
    _total = json['total'];
    _category = json['category'];
  }
  List<ItemBlogs>? _itemBlogs;
  num? _success;
  String? _message;
  num? _total;
  dynamic _category;
BlogListResponseModel copyWith({  List<ItemBlogs>? itemBlogs,
  num? success,
  String? message,
  num? total,
  dynamic category,
}) => BlogListResponseModel(  itemBlogs: itemBlogs ?? _itemBlogs,
  success: success ?? _success,
  message: message ?? _message,
  total: total ?? _total,
  category: category ?? _category,
);
  List<ItemBlogs>? get itemBlogs => _itemBlogs;
  num? get success => _success;
  String? get message => _message;
  num? get total => _total;
  dynamic get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_itemBlogs != null) {
      map['list'] = _itemBlogs?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    map['message'] = _message;
    map['total'] = _total;
    map['category'] = _category;
    return map;
  }

}

/// blog_id : "207"
/// title : "FOMO Frenzy & The Lure of Exotic Financial Products"
/// slug : "fomo-frenzy-the-lure-of-exotic-financial-products"
/// category : "General"
/// published_by : "Alpha Research"
/// published_date : "1688220052"
/// published_date_view : "Jul 01, 2023"
/// discription : "<p><span style=\"font-size:20px;\">I went shopping over the weekend, occasionally indulging in simple pleasures!! Coming back home, I noticed things that were not on my list, not needed in the truest sense, but I bought them. When wondering why and how this happened &ndash; I realised it was probably due to the placement of products, limited-time offers, encouraging testimonials, or customer reviews. My academic pursuit of behavioural science tells me it is not a coincidence but a time-tested marketing tactic of using nudges.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:#c0392b;\"><span style=\"font-size:20px;\"><strong>What are Nudges?</strong></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Technically, nudges are persuasive techniques that harness human cognitive biases and decision-making shortcuts to guide people towards specific choices or actions. Nudges are designed to influence behaviour without imposing strict rules or removing options.&nbsp;What&rsquo;s unique is that they predictably influence people&rsquo;s behaviour without restricting their choices.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">A prevalent nudge is&nbsp;<strong>FOMO</strong>&nbsp;(<strong>Fear-of-missing-out).&nbsp;</strong>In this psychological phenomenon, individuals experience anxiety or apprehension when they believe others are participating in rewarding experiences, events, or investments from which they are excluded. It is a potent motivator that drives people to conform, make impulsive decisions, and take unnecessary risks to avoid missing out on potential gains. A survey conducted by a renowned market research firm revealed that 72% of consumers admitted to experiencing FOMO about their personal finances and investment decisions.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Financial institutions or companies often capitalise on nudges by creating content showcasing seemingly overnight success stories, extraordinary returns, and exclusive financial products &amp; opportunities. These carefully curated narratives exploit our desire to keep up with others and instil a sense of urgency to participate, regardless of the quality of financial product or our financial suitability &amp; risk appetite.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Remember, the cryptocurrency space!! It witnessed its fair share of FOMO-induced fervour. With the meteoric rise of digital currencies, stories abound of individuals mortgaging their homes or depleting their life savings to ride the wave of crypto euphoria. The allure of quick riches and tales of overnight millionaires seduced many, often leading to financial ruin when the market inevitably corrects itself.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Recency bias creates a sense of relevance and attractiveness to potential buyers when dealing with trending products. The &ldquo;next big thing&rdquo; can be risky, as trends may be short-lived or subject to volatility.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">One more tactic sellers employ is to provide a wide range of investment options, making it seem like abundant choices are available and making buyers feel more comfortable and confident in their decision, even though the actual quality of the products may vary. It becomes evident when one analyses the offerings of various wealth management companies, brokerage firms, or investment platforms that provide numerous options. The sheer variety may overwhelm an investor, making it difficult to assess which products truly align with their goals, leading to decision paralysis or making impulsive choices.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Likewise, more often than not, the advisor sounds more confident than they are. Given their confidence, one must not forget that any year may wreck an excellent investment strategy, and random strategies may succeed.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:#c0392b;\"><span style=\"font-size:20px;\"><strong>How do investors react?</strong></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Investors driven by FOMO may make impulsive investment decisions without proper due diligence. They may fail to analyse the cost benefit analysis of the financial products or consider their risk tolerance, investment goals, and the long-term sustainability of the investment, leading to suboptimal outcomes. FOMO-driven investments often result in over-concentration in specific assets and over exposure in expensive, illiquid &amp; under performing investments. &nbsp;</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\"><input alt=\"\" src=\"http://res.cloudinary.com/dyedkdjm1/image/upload/v1688392938/jdedkzamhju1kujaxfgl.jpg\" style=\"width: 936px; height: 776px;\" type=\"image\" /></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:#c0392b;\"><span style=\"font-size:20px;\"><strong>How should investors react?</strong></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Nudges and FOMO are here to stay. It is a natural human emotion, but managing it is essential to avoid its pitfalls. It is crucial to approach FOMO-driven marketing with a critical mindset. To overcome the potential problems &ndash; transparency, education, and individual empowerment are vital. Individuals should take an active role in their financial decisions.</span></p>\r\n\r\n<ul>\r\n\t<li><span style=\"font-size:20px;\">Investors should focus on receiving transparent information, personalised advice, and comprehensive risk assessment.</span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n\t<li><span style=\"font-size:20px;\">Look beyond the surface-level information provided by sellers and delve into the details.</span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:20px;\">​​​​​​​</span></p>\r\n\r\n<ul>\r\n\t<li><span style=\"font-size:20px;\">Evaluate each product&rsquo;s track record, performance, fees, liquidity, tax and risks.</span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:20px;\">​​​​​​​</span></p>\r\n\r\n<ul>\r\n\t<li><span style=\"font-size:20px;\">Ask financial product sellers to provide expected post expense and post tax return. Analyse how much return leakage is happening due to expenses and taxes.</span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:20px;\">​​​​​​​</span></p>\r\n\r\n<ul>\r\n\t<li><span style=\"font-size:20px;\">Ask about the commission being paid to the intermediary/ advisor so that hidden conflicts can be identified.</span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:20px;\">​​​​​​​</span></p>\r\n\r\n<ul>\r\n\t<li><span style=\"font-size:20px;\">Define your investment objectives and risk tolerance and let it serve as a guiding framework to assess the suitability of the offered investment products.</span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:20px;\">​​​​​​​</span></p>\r\n\r\n<ul>\r\n\t<li><span style=\"font-size:20px;\">Remain disciplined, stick to your predetermined goals, and avoid being enticed by products that don&rsquo;t align with your financial objectives or risk appetite.</span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:20px;\">​​​​​​​</span></p>\r\n\r\n<ul>\r\n\t<li><span style=\"font-size:20px;\">Never let go of the long-term view and focus on your investment goals. Remember that successful investing requires patience, discipline, and a steady approach.</span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:20px;\">​​​​​​​​​​​​​​</span></p>\r\n\r\n<p><span style=\"font-size:20px;\">Above all, practice mindfulness and self-awareness. Recognise the emotions and psychological biases that can drive FOMO. By being self-aware, you can better control your emotions and make rational decisions based on your financial situation and goals.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">So, next time you encounter a phrase like &ldquo;Don&rsquo;t get left behind&rdquo;. Remind yourself of another phrase, &ldquo;Don&rsquo;t jump on the Bandwagon&rdquo;.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Best Regards</span><br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Dr. Tarunika Jain Agrawal Ph.D.&nbsp;</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:20px;\">Alpha Research</span></p>\r\n"
/// is_active : "1"
/// is_draft : "0"
/// blog_image : "http://res.cloudinary.com/dyedkdjm1/image/upload/v1688393046/kmb5drogqatzp8e9jfhw.jpg"
/// published_by_image : "http://res.cloudinary.com/dyedkdjm1/image/upload/v1687758943/o9rxxf4fosnurb23hjsv.png"
/// seo_title : "FOMO Frenzy & The Lure of Exotic Financial Products"
/// seo_keywords : "FOMO Frenzy & The Lure of Exotic Financial Products"
/// seo_description : "I went shopping over the weekend, occasionally indulging in simple pleasures!! Coming back home, I noticed things that were not on my list, not needed in the truest sense, but I bought them. When wondering why and how this happened – I realised it was probably due to the placement of products, limited-time offers, encouraging testimonials, or customer reviews. My academic pursuit of behavioural science tells me it is not a coincidence but a time-tested marketing tactic of using nudges."
/// seo_blog_image : "http://res.cloudinary.com/dyedkdjm1/image/upload/v1688393044/ax9t5nj78sfijowqmfgz.jpg"
/// created_at : "Jul 03, 2023"

ItemBlogs itemBlogsFromJson(String str) => ItemBlogs.fromJson(json.decode(str));
String itemBlogsToJson(ItemBlogs data) => json.encode(data.toJson());
class ItemBlogs {
  ItemBlogs({
      String? blogId, 
      String? title, 
      String? slug, 
      String? category, 
      String? publishedBy, 
      String? publishedDate, 
      String? publishedDateView, 
      String? discription, 
      String? isActive, 
      String? isDraft, 
      String? blogImage, 
      String? publishedByImage, 
      String? seoTitle, 
      String? seoKeywords, 
      String? seoDescription, 
      String? seoBlogImage, 
      String? createdAt,}){
    _blogId = blogId;
    _title = title;
    _slug = slug;
    _category = category;
    _publishedBy = publishedBy;
    _publishedDate = publishedDate;
    _publishedDateView = publishedDateView;
    _discription = discription;
    _isActive = isActive;
    _isDraft = isDraft;
    _blogImage = blogImage;
    _publishedByImage = publishedByImage;
    _seoTitle = seoTitle;
    _seoKeywords = seoKeywords;
    _seoDescription = seoDescription;
    _seoBlogImage = seoBlogImage;
    _createdAt = createdAt;
}

  ItemBlogs.fromJson(dynamic json) {
    _blogId = json['blog_id'];
    _title = json['title'];
    _slug = json['slug'];
    _category = json['category'];
    _publishedBy = json['published_by'];
    _publishedDate = json['published_date'];
    _publishedDateView = json['published_date_view'];
    _discription = json['discription'];
    _isActive = json['is_active'];
    _isDraft = json['is_draft'];
    _blogImage = json['blog_image'];
    _publishedByImage = json['published_by_image'];
    _seoTitle = json['seo_title'];
    _seoKeywords = json['seo_keywords'];
    _seoDescription = json['seo_description'];
    _seoBlogImage = json['seo_blog_image'];
    _createdAt = json['created_at'];
  }
  String? _blogId;
  String? _title;
  String? _slug;
  String? _category;
  String? _publishedBy;
  String? _publishedDate;
  String? _publishedDateView;
  String? _discription;
  String? _isActive;
  String? _isDraft;
  String? _blogImage;
  String? _publishedByImage;
  String? _seoTitle;
  String? _seoKeywords;
  String? _seoDescription;
  String? _seoBlogImage;
  String? _createdAt;
ItemBlogs copyWith({  String? blogId,
  String? title,
  String? slug,
  String? category,
  String? publishedBy,
  String? publishedDate,
  String? publishedDateView,
  String? discription,
  String? isActive,
  String? isDraft,
  String? blogImage,
  String? publishedByImage,
  String? seoTitle,
  String? seoKeywords,
  String? seoDescription,
  String? seoBlogImage,
  String? createdAt,
}) => ItemBlogs(  blogId: blogId ?? _blogId,
  title: title ?? _title,
  slug: slug ?? _slug,
  category: category ?? _category,
  publishedBy: publishedBy ?? _publishedBy,
  publishedDate: publishedDate ?? _publishedDate,
  publishedDateView: publishedDateView ?? _publishedDateView,
  discription: discription ?? _discription,
  isActive: isActive ?? _isActive,
  isDraft: isDraft ?? _isDraft,
  blogImage: blogImage ?? _blogImage,
  publishedByImage: publishedByImage ?? _publishedByImage,
  seoTitle: seoTitle ?? _seoTitle,
  seoKeywords: seoKeywords ?? _seoKeywords,
  seoDescription: seoDescription ?? _seoDescription,
  seoBlogImage: seoBlogImage ?? _seoBlogImage,
  createdAt: createdAt ?? _createdAt,
);
  String? get blogId => _blogId;
  String? get title => _title;
  String? get slug => _slug;
  String? get category => _category;
  String? get publishedBy => _publishedBy;
  String? get publishedDate => _publishedDate;
  String? get publishedDateView => _publishedDateView;
  String? get discription => _discription;
  String? get isActive => _isActive;
  String? get isDraft => _isDraft;
  String? get blogImage => _blogImage;
  String? get publishedByImage => _publishedByImage;
  String? get seoTitle => _seoTitle;
  String? get seoKeywords => _seoKeywords;
  String? get seoDescription => _seoDescription;
  String? get seoBlogImage => _seoBlogImage;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['blog_id'] = _blogId;
    map['title'] = _title;
    map['slug'] = _slug;
    map['category'] = _category;
    map['published_by'] = _publishedBy;
    map['published_date'] = _publishedDate;
    map['published_date_view'] = _publishedDateView;
    map['discription'] = _discription;
    map['is_active'] = _isActive;
    map['is_draft'] = _isDraft;
    map['blog_image'] = _blogImage;
    map['published_by_image'] = _publishedByImage;
    map['seo_title'] = _seoTitle;
    map['seo_keywords'] = _seoKeywords;
    map['seo_description'] = _seoDescription;
    map['seo_blog_image'] = _seoBlogImage;
    map['created_at'] = _createdAt;
    return map;
  }

}