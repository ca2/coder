// Created by camilo on 2022-05-30 08:29 PM <3ThomasBorregaardSørensen!!
#include "framework.h"


__FACTORY_EXPORT void app_simple_drawing_factory(::factory::factory* pfactory)
{

    pfactory->add_factory_item < ::app_simple_drawing::application, ::app >();

}
