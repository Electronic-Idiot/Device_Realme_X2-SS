/*
 * Copyright (C) 2020 LineageOS Project
 * Copyright (C) 2020 Harshit Jain
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <vector>
#include <string>
#include <fstream>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include <android-base/properties.h>
#include <android-base/logging.h>

#include "property_service.h"
#include "vendor_init.h"

struct x2_props
{
    std::string build_description;
    std::string build_fingerprint;
    std::string device_build;
    std::string product_device;
};

std::vector<std::string> ro_props_default_source_order = {
    "",
    "odm.",
    "product.",
    "system.",
    "vendor.",
};

static const char *snet_prop_key[] = {
    "ro.boot.vbmeta.device_state",
    "ro.boot.verifiedbootstate",
    "ro.boot.flash.locked",
    "ro.boot.selinux",
    "ro.boot.veritymode",
    "ro.boot.warranty_bit",
    "ro.warranty_bit",
    "ro.debuggable",
    "ro.secure",
    "ro.build.type",
    "ro.build.tags",
    "ro.build.selinux",
    NULL
};

static const char *snet_prop_value[] = {
    "locked",
    "green",
    "1",
    "enforcing",
    "enforcing",
    "0",
    "0",
    "0",
    "1",
    "user",
    "release-keys",
    "0",
    NULL
};

bool isCN()
{
    // Get region
    std::ifstream infile("/proc/oppoVersion/region");
    std::string region;
    bool ret = false;
    getline(infile, region);
    if (!region.compare("China"))
        ret = true;
    return ret;
}

bool hasNFC()
{
    // Check NFC
    std::ifstream infile("/proc/touchpanel/NFC_CHECK");
    std::string check;
    bool ret = false;
    getline(infile, check);
    if (!check.compare("SUPPORTED"))
        ret = true;
    return ret;
}

// Make life easier
bool isRMX1993()
{
    return (!isCN() && hasNFC());
}

void property_override(char const prop[], char const value[], bool add = true)
{
    prop_info *pi;
    pi = (prop_info *)__system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else if (add)
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

static void workaround_snet_properties() {
    for (int i = 0; snet_prop_key[i]; ++i)
        property_override(snet_prop_key[i], snet_prop_value[i]);
}

// Decommonise nfc properties
void load_nfc_props()
{
    property_override("persist.sys.nfc.disPowerSave", "1");
    property_override("persist.sys.nfc.default", "on");
    property_override("persist.sys.nfc.aid_overflow", "true");
    property_override("ro.product.cuptsm", "OPPO|ESE|01|02");
    property_override("persist.sys.nfc.antenna_area", "bottom");
}

void setRMX(const unsigned int variant)
{
    x2_props prop[3] = {};

    //RMX1991
    prop[0] = {
        "google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys",
        "walleye-user 8.1.0 OPM1.171019 011 4448085 release-keys",
        "RMX1991",
        "RMX1991CN",
    };

    //RMX992
    prop[1] = {
        "google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys",
        "walleye-user 8.1.0 OPM1.171019 011 4448085 release-keys",
        "RMX1992",
        "RMX1992L1",
    };

    //RMX1993
    prop[2] = {
        "google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys",
        "walleye-user 8.1.0 OPM1.171019 011 4448085 release-keys",
        "RMX1993",
        "RMX1993L1",
    };

    const auto set_ro_build_prop = [](const std::string &source,
                                      const std::string &prop, const std::string &value) {
        auto prop_name = "ro." + source + "build." + prop;
        property_override(prop_name.c_str(), value.c_str(), false);
    };

    const auto set_ro_product_prop = [](const std::string &source,
                                        const std::string &prop, const std::string &value) {
        auto prop_name = "ro.product." + source + prop;
        property_override(prop_name.c_str(), value.c_str(), false);
    };

    property_override("ro.build.description", prop[variant].build_fingerprint.c_str());
    property_override("ro.build.product", prop[variant].product_device.c_str());
    for (const auto &source : ro_props_default_source_order)
    {
        set_ro_build_prop(source, "fingerprint", prop[variant].build_description.c_str());
        set_ro_product_prop(source, "device", prop[variant].product_device.c_str());
        set_ro_product_prop(source, "model", prop[variant].device_build.c_str());
        set_ro_product_prop(source, "name", prop[variant].device_build.c_str());
    }


    // RMX1993 has different ptoduct name due to oversea variants further being divided into spain and europe
    if (variant == 2)
        for (const auto &source : ro_props_default_source_order)
            set_ro_product_prop(source, "name", "RMX1993EEA"); //override name props again

    //override again to be sure that it gets set.
    property_override("ro.build.fingerprint", prop[variant].build_description.c_str(), false);

    property_override("ro.apex.updatable", "false");

    // Load NFC properties only on RMX199{1:3}
    if (variant == 2 || variant == 0)
        load_nfc_props();
}

void vendor_load_properties()
{
    workaround_snet_properties();
    if (isRMX1993())
    {
        setRMX(2); //RMX1993
    }
    else if (!isCN())
    {
        setRMX(1); //RMX1992
    }
    else
    {
        setRMX(0); //RMX1991
    }
}
