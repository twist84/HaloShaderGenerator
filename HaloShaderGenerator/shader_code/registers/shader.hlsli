﻿#ifndef _SHADER_HLSLI
#define _SHADER_HLSLI

#include "../helpers/types.hlsli"

// Not sure if these are all constant or not
uniform bool no_dynamic_lights : register(b0);
uniform bool actually_calc_albedo : register(b12);

uniform float4 g_exposure : register(c0);
uniform float4 p_lighting_constant_0 : register(c1);
uniform float4 p_lighting_constant_1 : register(c2);
uniform float4 p_lighting_constant_2 : register(c3);
uniform float4 p_lighting_constant_3 : register(c4);
uniform float4 p_lighting_constant_4 : register(c5);
uniform float4 p_lighting_constant_5 : register(c6);
uniform float4 p_lighting_constant_6 : register(c7);
uniform float4 p_lighting_constant_7 : register(c8);
uniform float4 p_lighting_constant_8 : register(c9);
uniform float4 p_lighting_constant_9 : register(c10);
uniform float4 __unknown_c11 : register(c11);
uniform float4 __unknown_c12 : register(c12);
uniform float4 __unknown_c13 : register(c13);
uniform float2 texture_size : register(c14);
uniform float4 dynamic_environment_blend : register(c15);
uniform float3 Camera_Position_PS : register(c16);
uniform float simple_light_count : register(c17);
struct SimpleLight
{
    float4 unknown0;
    float4 unknown1;
    float4 unknown2;
    float4 unknown3;
    float4 unknown4;
};
uniform SimpleLight simple_lights[8] : register(c18);

/*
This region here is where dynamically created uniforms are allowed
Not entirely sure where this ends
*/

/*
-------------------------------------------------- ALBEDO
*/

uniform sampler scene_ldr_texture;
uniform sampler albedo_texture;
uniform sampler normal_texture;

uniform float4 albedo_color;
uniform float4 albedo_color2;
uniform float4 albedo_color3;

uniform sampler base_map;
uniform xform2d base_map_xform;
// no idea why this is so, this seems to disappear when hightmaps are present :/
// we need a better solution for this
//NOTE: We should be able to macro this out

#if envmap_type_arg != k_environment_mapping_custom_map_dynamic
uniform sampler __unknown_s1 : register(s1);
#endif

uniform sampler detail_map;
uniform xform2d detail_map_xform;

uniform float4 debug_tint;

uniform sampler detail_map2;
uniform xform2d detail_map2_xform;

uniform sampler change_color_map;
uniform xform2d change_color_map_xform;
uniform float3 primary_change_color;
uniform float3 secondary_change_color;

uniform float3 tertiary_change_color;
uniform float3 quaternary_change_color;

uniform sampler detail_map3;
uniform xform2d detail_map3_xform;

uniform sampler detail_map_overlay;
uniform xform2d detail_map_overlay_xform;

uniform sampler color_mask_map;
uniform xform2d color_mask_map_xform;
uniform float4 neutral_gray;


/*
-------------------------------------------------- END ALBEDO
*/

/*
-------------------------------------------------- BUMP MAPPING
*/

uniform sampler bump_map;
uniform xform2d bump_map_xform;
uniform sampler bump_detail_map;
uniform xform2d bump_detail_map_xform;
uniform xform2d bump_detail_coefficient;
uniform sampler bump_detail_mask_map;
uniform xform2d bump_detail_mask_map_xform;

/*
-------------------------------------------------- END BUMP MAPPING
*/

#define boolf float

float self_illum_intensity;
float4 self_illum_map_xform;
sampler2D self_illum_map;
float4 self_illum_color;

float diffuse_coefficient;
float specular_coefficient;

float area_specular_contribution;
float analytical_specular_contribution;
float environment_map_specular_contribution;

boolf order3_area_specular; // bool order3_area_specular; this is weird, its a bool sitting in a constant register?????? 

float normal_specular_power;
float3 normal_specular_tint;

float glancing_specular_power;
float3 glancing_specular_tint;

float fresnel_curve_steepness;
float albedo_specular_tint_blend;
float analytical_anti_shadow_control;

uniform float4 env_tint_color;
uniform float env_roughness_scale;
samplerCUBE dynamic_environment_map_0;
samplerCUBE dynamic_environment_map_1;

uniform float4 primary_change_color_old : register(c190); // TODO Figure this one out
uniform float4 secondary_change_color_old : register(c191); // TODO Figure this one out
uniform float4 k_ps_active_camo_factor : register(c212);



#endif
