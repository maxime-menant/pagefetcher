# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Page do

  it 'should not save a Page without a FB ID' do
    page = Page.new
    page.should_not be_valid
  end

  it 'should not save a Page with an invalid FB ID' do
    page = Page.new
    page.fb_id = 000000000000
    page.should_not be_valid
  end

  it 'should save a Page with a valid FB ID' do
    page = Page.new
    page.fb_id = 188091757763
    page.should be_valid
    page.save.should be_true
  end

  it 'should not save a Page twice' do
    page = Page.create(:fb_id => 188091757763)
    page.save.should be_true

    page2 = Page.new(:fb_id => 188091757763)
    page2.should_not be_valid
    page2.should have(1).errors_on(:fb_id)
  end

  context 'existing valid page' do

    before do
      @page = Page.new
      @page.stub(:page_data).and_return(
        {
          "id"      => "188091757763",
          "name"    => "Tigerlily",
          "picture" => {
            "data"    => {
              "url"           => "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373495_188091757763_2103948167_q.jpg",
              "is_silhouette" => false
            }
          }
        }
      )
    end

    it 'should return its page name' do
      @page.name.should == 'Tigerlily'
    end

    it 'should return its picture url' do
      @page.picture_url.should == 'http://profile.ak.fbcdn.net/hprofile-ak-ash4/373495_188091757763_2103948167_q.jpg'
    end
  end


  context 'page feed' do

    before do
      @page = Page.new
      @page.stub(:feed_data).and_return(
        [
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "Meet our CEO Matthieu Chereau at LeWeb",
              "picture"=> "https=>//fbcdn-photos-a.akamaihd.net/hphotos-ak-snc7/395002_10151323367992764_1614828285_s.jpg",
              "created_time"=> "2012-12-04T10=>22=>21+0000",
              "link"=> "https=>//www.facebook.com/photo.php?fbid=10151323367992764&set=a.268459097763.146372.188091757763&type=1&relevant_count=1",
              "id"=> "188091757763_10151323368007764"
            },
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "Congrats to Marc, Etienne, Benjamin, Kevin and Emiland who worked on an amazing side project and finished in 3rd place at the Paris AngelHack with TheGoodsLife. They built a social platform in 24 hours where you can give your goods a second life, or a third. You offer an object, you request another, and at the end you contribute to both stories.",
              "picture"=> "https=>//fbexternal-a.akamaihd.net/safe_image.php?d=AQBMny6qNl_dlFYe&w=130&h=130&url=http%3A%2F%2Fi4.ytimg.com%2Fvi%2Fc2iqbAirnAk%2Fmqdefault.jpg",
              "created_time"=> "2012-12-03T16=>01=>33+0000",
              "link"=> "http=>//shrt.tl/nynT",
              "id"=> "188091757763_285979414857133"
            },
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "To measure your engagement rate, you have to access private data of your Facebook Page to take into consideration interactions outside the posts of your page=> subscription to an event, fans posts, videos views, clicks on your Page via the newsfeed...",
              "picture"=> "https=>//fbexternal-a.akamaihd.net/safe_image.php?d=AQC1h7-tfWIMNE-r&w=90&h=90&url=http%3A%2F%2Fblog.tigerlilyapps.com%2Fwp-content%2Fuploads%2F2012%2F09%2Finsightsfeature.png",
              "created_time"=> "2012-12-03T15=>00=>08+0000",
              "link"=> "http=>//shrt.tl/1bws",
              "id"=> "188091757763_492164270816423"
            },
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "Cacharel propose une app de couponing, développée par Tigerlily et offre une place de cinéma pour l'achat du parfum Amor Amor.",
              "picture"=> "https=>//fbcdn-photos-a.akamaihd.net/photos-ak-snc7/v85005/100/542647502431876/app_10_542647502431876_478269861.gif",
              "created_time"=> "2012-12-03T09=>36=>29+0000",
              "link"=> "https=>//www.facebook.com/AmorAmor?sk=app_542647502431876",
              "id"=> "188091757763_447537168628009"
            },
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "When our Art Director and a Front-End Developer work on the perfect pixel http=>//instagr.am/p/SqQ29VNRTI/",
              "picture"=> "https=>//fbcdn-photos-a.akamaihd.net/hphotos-ak-ash3/28050_10151317557852764_1051202897_s.jpg",
              "created_time"=> "2012-11-30T16=>30=>33+0000",
              "link"=> "https=>//www.facebook.com/photo.php?fbid=10151317557852764&set=a.10150591314282764.413564.188091757763&type=1&relevant_count=1",
              "id"=> "188091757763_10151317557887764"
            },
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "Monthly wine tasting http=>//instagr.am/p/Sn2gTqNRSK/",
              "picture"=> "https=>//fbcdn-photos-a.akamaihd.net/hphotos-ak-prn1/32290_10151316089587764_372600995_s.jpg",
              "created_time"=> "2012-11-29T18=>00=>06+0000",
              "link"=> "https=>//www.facebook.com/photo.php?fbid=10151316089587764&set=a.10150591314282764.413564.188091757763&type=1&relevant_count=1",
              "id"=> "188091757763_10151316089627764"
            },
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "How to measure the R.O.I. of your Facebook Apps? Value your users and stories generated by your social experiences.",
              "picture"=> "https=>//fbexternal-a.akamaihd.net/safe_image.php?d=AQBSmeADMz9zZW-E&w=90&h=90&url=http%3A%2F%2Fblog.tigerlilyapps.com%2Fwp-content%2Fuploads%2F2012%2F11%2Ffeatureapp.jpg",
              "created_time"=> "2012-11-29T13=>46=>35+0000",
              "link"=> "http=>//shrt.tl/ilsC",
              "id"=> "188091757763_129374397217602"
            },
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "Comment calculer le R.O.I. de vos apps Facebook? Tigerlily vous donne les clés pour valoriser vos utilisateurs et les Stories générées par vos experiences sociales.",
              "picture"=> "https=>//fbexternal-a.akamaihd.net/safe_image.php?d=AQBSmeADMz9zZW-E&w=90&h=90&url=http%3A%2F%2Fblog.tigerlilyapps.com%2Fwp-content%2Fuploads%2F2012%2F11%2Ffeatureapp.jpg",
              "created_time"=> "2012-11-28T17=>40=>16+0000",
              "link"=> "http=>//shrt.tl/z3oQ",
              "id"=> "188091757763_516587848365011"
            },
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "Pour bien calculer le taux d'engagement de vos Pages, il faut accéder à ses données privées car il existe de nombreuses interactions qui peuvent exprimer l’engagement de vos fans en dehors des posts de votre page =>  l’inscription à un évènement, les posts des fans, les vues sur vos vidéos, les clics sur votre page via le fil d’actualité des utilisateurs…",
              "picture"=> "https=>//fbexternal-a.akamaihd.net/safe_image.php?d=AQC1h7-tfWIMNE-r&w=90&h=90&url=http%3A%2F%2Fblog.tigerlilyapps.com%2Fwp-content%2Fuploads%2F2012%2F09%2Finsightsfeature.png",
              "created_time"=> "2012-11-28T11=>26=>49+0000",
              "link"=> "http=>//shrt.tl/PeOJ",
              "id"=> "188091757763_304040303030479"
            },
            {
              "from"=> {
                "name"=> "Tigerlily",
                "category"=> "Internet/software",
                "id"=> "188091757763"
              },
              "message"=> "Support the Pop Market Success Story on Facebook Studio. A new mobile experience with Geolocation, Facebook and Passbook integration. A unique way to reach new clients and drive traffic to POS using Facebook mobile apps. Like it and share it on=> http=>//bit.ly/RdH93b",
              "picture"=> "https=>//fbcdn-photos-a.akamaihd.net/hphotos-ak-snc6/270143_10151311765772764_1662206348_s.png",
              "created_time"=> "2012-11-26T18=>50=>48+0000",
              "link"=> "https=>//www.facebook.com/photo.php?fbid=10151311765772764&set=a.268459097763.146372.188091757763&type=1&relevant_count=1",
              "id"=> "188091757763_10151311765867764"
            }
          ]
      )
    end

    it 'should return at most 10 elements' do
      @page.feed.should_not be_empty
      @page.feed.size.should <= 10
    end

    it 'should create a collection of FeedData' do
      @page.feed.first.should be_instance_of FeedData
    end

    it 'should parse and return author, message, picture_url, created_at, link and id for each feed data' do
      @page.feed.each do |d|
        d.author.should_not be_blank
        d.message.should_not be_blank
        d.picture_url.should_not be_blank
        d.created_at.should_not be_blank
        d.link.should_not be_blank
        d.id.should_not be_blank
      end
    end
  end

end

