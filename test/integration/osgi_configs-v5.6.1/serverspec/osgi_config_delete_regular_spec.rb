require_relative '../../../kitchen/data/spec_helper'

describe 'OSGi com.adobe.cq.wcm.launches.impl.LaunchesEventHandler' do
  it 'exists' do
    expect(
      @config_list.include?(
        'com.adobe.cq.wcm.launches.impl.LaunchesEventHandler'
      )
    ).to be true
  end

  it 'there was 1 UPDATE request' do
    expect(
      @osgi_config_helper.regular_update_requests(
        'com.adobe.cq.wcm.launches.impl.LaunchesEventHandler'
      ).length
    ).to eq(1)
  end

  it 'there was 1 DELETE request' do
    expect(
      @osgi_config_helper.delete_requests(
        'com.adobe.cq.wcm.launches.impl.LaunchesEventHandler'
      ).length
    ).to eq(1)
  end

  # 1) Read current
  # 2) Update
  # 3) Read current
  # 4) Delete
  it 'in total there were 4 HTTP requests' do
    expect(
      @osgi_config_helper.all_requests(
        'com.adobe.cq.wcm.launches.impl.LaunchesEventHandler'
      ).length
    ).to eq(4)
  end

  it 'launches.eventhandler.threadpool.maxsize is set to 5' do
    expect(
      @osgi_config_helper.config_value(
        'com.adobe.cq.wcm.launches.impl.LaunchesEventHandler',
        'launches.eventhandler.threadpool.maxsize'
      )
    ).to eq('5')
  end

  it 'launches.eventhandler.threadpool.priority is set to MIN' do
    expect(
      @osgi_config_helper.config_value(
        'com.adobe.cq.wcm.launches.impl.LaunchesEventHandler',
        'launches.eventhandler.threadpool.priority'
      )
    ).to eq('MIN')
  end
end

describe 'OSGi com.adobe.cq.commerce.impl.promotion.PromotionManagerImpl' do
  it 'there was 0 DELETE requests' do
    expect(
      @osgi_config_helper.delete_requests(
        'com.adobe.cq.commerce.impl.promotion.PromotionManagerImpl'
      ).length
    ).to eq(0)
  end

  # Just a READ request
  it 'in total there was 1 HTTP request' do
    expect(
      @osgi_config_helper.all_requests(
        'com.adobe.cq.commerce.impl.promotion.PromotionManagerImpl'
      ).length
    ).to eq(1)
  end

  it 'cq.commerce.promotion.root is set to /content/campaigns' do
    expect(
      @osgi_config_helper.config_value(
        'com.adobe.cq.commerce.impl.promotion.PromotionManagerImpl',
        'cq.commerce.promotion.root'
      )
    ).to eq('/content/campaigns')
  end
end

describe 'OSGi com.adobe.granite.auth.oauth.impl.TwitterProviderImpl' do
  it 'there was 1 DELETE request' do
    expect(
      @osgi_config_helper.delete_requests(
        'com.adobe.granite.auth.oauth.impl.TwitterProviderImpl'
      ).length
    ).to eq(1)
  end

  # READ + DELETE
  it 'in total there were 2 HTTP requests' do
    expect(
      @osgi_config_helper.all_requests(
        'com.adobe.granite.auth.oauth.impl.TwitterProviderImpl'
      ).length
    ).to eq(2)
  end

  it 'oauth.provider.id set to twitter' do
    expect(
      @osgi_config_helper.config_value(
        'com.adobe.granite.auth.oauth.impl.TwitterProviderImpl',
        'oauth.provider.id'
      )
    ).to eq('twitter')
  end
end
