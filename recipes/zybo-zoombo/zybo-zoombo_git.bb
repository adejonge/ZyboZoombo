DESCRIPTION = "ZyboZoombo, control a robotic vehicle using ros and communicating with FPGA"
SECTION = "devel"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://package.xml;;beginline=7;endline=7;md5=05c8b019cf5b0834bc5e547a14f26ca3"

ROS_CN = "zybo-zoombo"
ROS_BPN = "zybo-zoombo"

ROS_BUILD_DEPENDS = " \
    roscpp \
"

ROS_BUILDTOOL_DEPENDS = " \
    catkin-native \
"

ROS_EXPORT_DEPENDS = " \
    roscpp \
"

ROS_BUILDTOOL_EXPORT_DEPENDS = ""

ROS_EXEC_DEPENDS = " \
    roscpp \
"

ROS_TEST_DEPENDS = ""

DEPENDS = "${ROS_BUILD_DEPENDS} ${ROS_BUILDTOOL_DEPENDS}"

DEPENDS += "${ROS_EXPORT_DEPENDS} ${ROS_BUILDTOOL_EXPORT_DEPENDS}"

RDEPENDS_${PN} += "${ROS_EXEC_DEPENDS}"

SRC_URI = "git://github.com/adejonge/ZyboZoombo.git;"branch=main";protocol=https"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

ROS_BUILD_TYPE = "catkin"

inherit ros_${ROS_BUILD_TYPE}
