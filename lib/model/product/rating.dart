class Rating {
	double? rate;
	int? count;

	Rating({this.rate, this.count});

	factory Rating.fromModel(Map<String, dynamic> json) => Rating(
				rate: (json['rate'] as num?)?.toDouble(),
				count: json['count'] as int?,
			);

	Map<String, dynamic> toModel() => {
				'rate': rate,
				'count': count,
			};
}
