platform:ios,'10.0
'
inhibit_all_warnings!
use_frameworks!

def pods
    #必要库
    pod 'Moya', '~> 13.0.0-beta.1'
    pod 'SVProgressHUD'
    pod 'MJRefresh'
    pod 'SnapKit'
    pod 'Kingfisher', '~> 5.3.1'
    pod 'HandyJSON', '5.0.0-beta.1'
end

target 'SwiftDemo' do
    pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end
