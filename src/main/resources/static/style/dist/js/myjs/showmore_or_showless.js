function showResponseData() {
		/**************************company name by its id*****************************/
			//console.log('all cmp id replacing its name... ');
			$(".cmpname").each(function() {
				var cmp_id = this.id;
				//console.log("cmpname:-"+cmp_id);
				$.ajax({
					type : "GET",
					url : "getCompanyDetails?company_id=" + cmp_id,
					success : function(response) {
						$(".cmp" + cmp_id).html(response.company_name);
						//console.log("response->company_name:-"+response.company_name);

						return response;
					},
					error : function() {
						//alert(error_fetch);
					}
				});
			});
			/****END****/
			/***********************read more*************************************/
			//console.log(' show more function... ');
			var showChar = 100; // How many characters are shown by default
			var ellipsestext = "...";
			var moretext = "Show more";
			var lesstext = "Show less";

			$('.more')
					.each(
							function() {
								var content = $(this).html();

								if (content.length > showChar) {

									var c = content.substr(0, showChar);
									var h = content.substr(showChar,
											content.length - showChar);

									var html = c
											+ '<span class="moreellipses">'
											+ ellipsestext
											+ '&nbsp;</span><span class="morecontent"><span>'
											+ h
											+ '</span>&nbsp;&nbsp;<a href="" class="morelink">'
											+ moretext + '</a></span>';

									$(this).html(html);
								}

							});

			$(".morelink").click(function() {
				if ($(this).hasClass("less")) {
					$(this).removeClass("less");
					$(this).html(moretext);
				} else {
					$(this).addClass("less");
					$(this).html(lesstext);
				}
				$(this).parent().prev().toggle();
				$(this).prev().toggle();
				return false;
			});
			/****END****/
		}
