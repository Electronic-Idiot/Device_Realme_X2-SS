# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_steps=7 \
    ro.qc.sdk.audio.fluencetype=none \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.bluetooth.soc=cherokee \
    persist.vendor.bt.a2dp.aac_whitelist=false \
    persist.vendor.btstack.enable.splita2dp=true \
    persist.vendor.btstack.enable.twsplus=true \
    persist.vendor.btstack.enable.twsplussho=true \
    ro.bluetooth.library_name=libbluetooth_qti.so \
    persist.bluetooth.bqr.event_mask=0x8000000E \
    persist.bluetooth.bqr.min_interval_ms=60000 \
    persist.bluetooth.bqr.choppy_threshold=9,6 \
    persist.bluetooth.disableabsvol=false \
    persist.vendor.service.bt.iot.enablelogging=true \
    persist.vendor.bluetooth.a2dp.hal.implementation=true \
    persist.vendor.bt.a2dp.hal.implementation=true \
    persist.bluetooth.disableinbandringing=false \
    persist.bluetooth.specificatcmdsenable=true \
    persist.vendor.bluetooth.modem_nv_support=true \
    persist.vendor.service.bdroid.soc.alwayson=true \
    persist.vendor.service.bt.iotinfo.report.enable=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.light_ae.enable=1 \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera,org.lineageos.snap

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=0 \
    persist.vendor.dpm.feature=0

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    ro.camera.hfr.enable=1 \
    ro.camera.relight.enable=0 \
    ro.camera.attr.detect.enable=1 \
    ro.camera.temperature.limit=470

# Charger
PRODUCT_PROPERTY_OVERRIDES += \
    ro.charger.enable_suspend=true

# Data modules
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.netmgrd.qos.enable=true \
    persist.vendor.data.profile_update=true \
    persist.vendor.data.mode=concurrent \
    ro.vendor.use_data_netmgrd=true

# Dex
PRODUCT_PRODUCT_PROPERTIES += \
    dalvik.vm.dex2oat64.enabled=true \
    ro.vendor.qti.am.reschedule_service=true \
    ro.sys.fw.dex2oat_thread_count=8 \
    dalvik.vm.boot-dex2oat-threads=8 \
    dalvik.vm.dex2oat-cpu-set=0,1,2,3,4,5,6,7 \
    dalvik.vm.dex2oat-filter=quicken \
    dalvik.vm.dex2oat-threads=8 \
    dalvik.vm.image-dex2oat-cpu-set=0,1,2,3,4,5,6,7 \
    dalvik.vm.image-dex2oat-filter=quicken \
    dalvik.vm.image-dex2oat-threads=8

# Display post-processing
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.enable_gl_backpressure=1 \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.wcg_composition_dataspace=143261696 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.protected_contents=true \
    ro.vendor.display.ad=1 \
    ro.vendor.display.sensortype=2 \
    ro.vendor.display.ad.sdr_calib_data=/vendor/etc/OPPO_OLED_AD_calib.cfg \
    ro.input.video_enabled=false


# Offsets
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.use_phase_offsets_as_durations=1 \
    debug.sf.late.sf.duration=10500000 \
    debug.sf.late.app.duration=20500000 \
    debug.sf.early.sf.duration=21000000 \
    debug.sf.early.app.duration=16500000 \
    debug.sf.earlyGl.sf.duration=13500000 \
    debug.sf.earlyGl.app.duration=21000000

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.realme.lockstate=0

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    dev.pm.dyn_samplingrate=1 \
    persist.front.skipdisplay.enable=1

#lmkd options
PRODUCT_PRODUCT_PROPERTIES += \
	ro.config.low_ram=false \
	ro.lmk.log_stats=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.settings.xml=/system/etc/media_profiles_vendor.xml \
    media.stagefright.thumbnail.prefer_hw_codecs=true \
    persist.mm.enable.prefetch=true \
    ro.media.recorder-max-base-layer-fps=60 \
    vendor.media.vpp.enable=true

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# Netflix custom property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.netflix.bsp_rev=Q6150-17263-1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.core_ctl_min_cpu=4 \
    ro.vendor.qti.core_ctl_max_cpu=6

# RCS and IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.ims_volte_enable=1 \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.rcs.supported=0 \
    persist.vendor.ims.disableQXDMLogs=0 \
    persist.vendor.ims.disableADBLogs=0 \
    persist.vendor.ims.disableDebugLogs=0 \
    persist.vendor.ims.disableIMSLogs=0 \
    persist.vendor.ims.rtp.enableqxdm=3 \
    persist.vendor.ims.vt.enableadb=3

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    persist.sys.fflag.override.settings_network_and_internet_v2=true \
    persist.radio.hvolte.enable=1 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.lte_vrte_ltd=1 \
    persist.vendor.radio.cs_srv_type=1 \
    persist.vendor.radio.rat_on=combine \
    ril.subscription.types=NV,RUIM \
    persist.radio.add_power_save=1 \
    persist.radio.multisim.config=dsds \
    persist.radio.custom_exp_ecc=1 \
    persist.vendor.radio.process_sups_ind=1 \
    persist.vendor.radio.data_con_rprt=1 \
    persist.data.iwlan.enable=true \
    persist.data.iwlan.rekey=4294967295 \
    ro.telephony.default_network=22,20 \
    telephony.lteOnCdmaDevice=1 \
    persist.sys.fflag.override.settings_provider_model=false

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sensors.enable.mag_filter=true \
    ro.display.underscreen.lightsensor.support=1 \
    ro.lcd.display.screen.underlightsensor.region=624,28,672,76 \
    persist.sys.oppo.fusionlight=true \
    persist.sys.oppo.proximity=true \
    ro.qti.sensors.wu=false \
    ro.support_one_handed_mode=true


# SSR
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.ssr.enable_ramdumps=0 \
    persist.vendor.ssr.restart_level=ALL_ENABLE

# Zram
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zram.mark_idle_delay_mins=60\
    ro.zram.first_wb_delay_mins=180\
    ro.zram.periodic_wb_delay_hours=24

# Zygote
PRODUCT_PROPERTY_OVERRIDES += \
    persist.device_config.runtime_native.usap_pool_enabled=true

# Fingerprint
fingerprint.nocleanup=true