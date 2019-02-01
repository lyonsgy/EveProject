platform:ios,'9.0'
inhibit_all_warnings!
use_frameworks!

def pods
    #必要库
    pod 'Moya'
    pod 'HandyJSON', '~> 4.2.0'
    pod 'SVProgressHUD'
    pod 'MJRefresh'
    pod 'SnapKit'
end

target 'SwiftDemo' do
    pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'
        end
    end
end
