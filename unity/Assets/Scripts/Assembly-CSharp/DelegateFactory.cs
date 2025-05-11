using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
using BestHTTP;
using DG.Tweening;
using DG.Tweening.Core;
using DragonBones;
using LuaInterface;
using Spine;
using Spine.Unity;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;

public class DelegateFactory
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate Delegate DelegateCreate(LuaFunction func, LuaTable self, bool flag);

	private class System_Action_Event : LuaDelegate
	{
		public System_Action_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Action_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UnityEngine_Events_UnityAction_Event : LuaDelegate
	{
		public UnityEngine_Events_UnityAction_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_Events_UnityAction_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class System_Predicate_int_Event : LuaDelegate
	{
		public System_Predicate_int_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Predicate_int_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public bool Call(int param0)
		{
			return false;
		}

		public bool CallWithSelf(int param0)
		{
			return false;
		}
	}

	private class System_Action_int_Event : LuaDelegate
	{
		public System_Action_int_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Action_int_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(int param0)
		{
		}

		public void CallWithSelf(int param0)
		{
		}
	}

	private class System_Comparison_int_Event : LuaDelegate
	{
		public System_Comparison_int_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Comparison_int_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public int Call(int param0, int param1)
		{
			return 0;
		}

		public int CallWithSelf(int param0, int param1)
		{
			return 0;
		}
	}

	private class System_Func_int_int_Event : LuaDelegate
	{
		public System_Func_int_int_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Func_int_int_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public int Call(int param0)
		{
			return 0;
		}

		public int CallWithSelf(int param0)
		{
			return 0;
		}
	}

	private class EventDelegate_Callback_Event : LuaDelegate
	{
		public EventDelegate_Callback_Event(LuaFunction func)
			: base(null)
		{
		}

		public EventDelegate_Callback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_float_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_float_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_float_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public float Call()
		{
			return 0f;
		}

		public float CallWithSelf()
		{
			return 0f;
		}
	}

	private class DG_Tweening_Core_DOSetter_float_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_float_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_float_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(float param0)
		{
		}

		public void CallWithSelf(float param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_double_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_double_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_double_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public double Call()
		{
			return 0.0;
		}

		public double CallWithSelf()
		{
			return 0.0;
		}
	}

	private class DG_Tweening_Core_DOSetter_double_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_double_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_double_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(double param0)
		{
		}

		public void CallWithSelf(double param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_int_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_int_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_int_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public int Call()
		{
			return 0;
		}

		public int CallWithSelf()
		{
			return 0;
		}
	}

	private class DG_Tweening_Core_DOSetter_int_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_int_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_int_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(int param0)
		{
		}

		public void CallWithSelf(int param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_uint_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_uint_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_uint_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public uint Call()
		{
			return 0u;
		}

		public uint CallWithSelf()
		{
			return 0u;
		}
	}

	private class DG_Tweening_Core_DOSetter_uint_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_uint_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_uint_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(uint param0)
		{
		}

		public void CallWithSelf(uint param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_long_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_long_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_long_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public long Call()
		{
			return 0L;
		}

		public long CallWithSelf()
		{
			return 0L;
		}
	}

	private class DG_Tweening_Core_DOSetter_long_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_long_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_long_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(long param0)
		{
		}

		public void CallWithSelf(long param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_ulong_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_ulong_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_ulong_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public ulong Call()
		{
			return 0uL;
		}

		public ulong CallWithSelf()
		{
			return 0uL;
		}
	}

	private class DG_Tweening_Core_DOSetter_ulong_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_ulong_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_ulong_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(ulong param0)
		{
		}

		public void CallWithSelf(ulong param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_string_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_string_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_string_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public string Call()
		{
			return null;
		}

		public string CallWithSelf()
		{
			return null;
		}
	}

	private class DG_Tweening_Core_DOSetter_string_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_string_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_string_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0)
		{
		}

		public void CallWithSelf(string param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_UnityEngine_Vector2_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_UnityEngine_Vector2_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_UnityEngine_Vector2_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public Vector2 Call()
		{
			return default(Vector2);
		}

		public Vector2 CallWithSelf()
		{
			return default(Vector2);
		}
	}

	private class DG_Tweening_Core_DOSetter_UnityEngine_Vector2_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_UnityEngine_Vector2_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_UnityEngine_Vector2_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Vector2 param0)
		{
		}

		public void CallWithSelf(Vector2 param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_UnityEngine_Vector3_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_UnityEngine_Vector3_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_UnityEngine_Vector3_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public Vector3 Call()
		{
			return default(Vector3);
		}

		public Vector3 CallWithSelf()
		{
			return default(Vector3);
		}
	}

	private class DG_Tweening_Core_DOSetter_UnityEngine_Vector3_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_UnityEngine_Vector3_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_UnityEngine_Vector3_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Vector3 param0)
		{
		}

		public void CallWithSelf(Vector3 param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_UnityEngine_Vector4_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_UnityEngine_Vector4_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_UnityEngine_Vector4_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public Vector4 Call()
		{
			return default(Vector4);
		}

		public Vector4 CallWithSelf()
		{
			return default(Vector4);
		}
	}

	private class DG_Tweening_Core_DOSetter_UnityEngine_Vector4_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_UnityEngine_Vector4_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_UnityEngine_Vector4_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Vector4 param0)
		{
		}

		public void CallWithSelf(Vector4 param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public Quaternion Call()
		{
			return default(Quaternion);
		}

		public Quaternion CallWithSelf()
		{
			return default(Quaternion);
		}
	}

	private class DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Quaternion param0)
		{
		}

		public void CallWithSelf(Quaternion param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_UnityEngine_Color_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_UnityEngine_Color_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_UnityEngine_Color_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public Color Call()
		{
			return default(Color);
		}

		public Color CallWithSelf()
		{
			return default(Color);
		}
	}

	private class DG_Tweening_Core_DOSetter_UnityEngine_Color_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_UnityEngine_Color_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_UnityEngine_Color_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Color param0)
		{
		}

		public void CallWithSelf(Color param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_UnityEngine_Rect_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_UnityEngine_Rect_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_UnityEngine_Rect_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public Rect Call()
		{
			return default(Rect);
		}

		public Rect CallWithSelf()
		{
			return default(Rect);
		}
	}

	private class DG_Tweening_Core_DOSetter_UnityEngine_Rect_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_UnityEngine_Rect_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_UnityEngine_Rect_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Rect param0)
		{
		}

		public void CallWithSelf(Rect param0)
		{
		}
	}

	private class DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public RectOffset Call()
		{
			return null;
		}

		public RectOffset CallWithSelf()
		{
			return null;
		}
	}

	private class DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_Event : LuaDelegate
	{
		public DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(RectOffset param0)
		{
		}

		public void CallWithSelf(RectOffset param0)
		{
		}
	}

	private class DG_Tweening_TweenCallback_Event : LuaDelegate
	{
		public DG_Tweening_TweenCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_TweenCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class DG_Tweening_TweenCallback_int_Event : LuaDelegate
	{
		public DG_Tweening_TweenCallback_int_Event(LuaFunction func)
			: base(null)
		{
		}

		public DG_Tweening_TweenCallback_int_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(int param0)
		{
		}

		public void CallWithSelf(int param0)
		{
		}
	}

	private class UnityEngine_Camera_CameraCallback_Event : LuaDelegate
	{
		public UnityEngine_Camera_CameraCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_Camera_CameraCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Camera param0)
		{
		}

		public void CallWithSelf(Camera param0)
		{
		}
	}

	private class UnityEngine_Application_AdvertisingIdentifierCallback_Event : LuaDelegate
	{
		public UnityEngine_Application_AdvertisingIdentifierCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_Application_AdvertisingIdentifierCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0, bool param1, string param2)
		{
		}

		public void CallWithSelf(string param0, bool param1, string param2)
		{
		}
	}

	private class UnityEngine_Application_LowMemoryCallback_Event : LuaDelegate
	{
		public UnityEngine_Application_LowMemoryCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_Application_LowMemoryCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UnityEngine_Application_LogCallback_Event : LuaDelegate
	{
		public UnityEngine_Application_LogCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_Application_LogCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0, string param1, LogType param2)
		{
		}

		public void CallWithSelf(string param0, string param1, LogType param2)
		{
		}
	}

	private class System_Action_bool_Event : LuaDelegate
	{
		public System_Action_bool_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Action_bool_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(bool param0)
		{
		}

		public void CallWithSelf(bool param0)
		{
		}
	}

	private class System_Func_bool_Event : LuaDelegate
	{
		public System_Func_bool_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Func_bool_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public bool Call()
		{
			return false;
		}

		public bool CallWithSelf()
		{
			return false;
		}
	}

	private class UnityEngine_AudioClip_PCMReaderCallback_Event : LuaDelegate
	{
		public UnityEngine_AudioClip_PCMReaderCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_AudioClip_PCMReaderCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(float[] param0)
		{
		}

		public void CallWithSelf(float[] param0)
		{
		}
	}

	private class UnityEngine_AudioClip_PCMSetPositionCallback_Event : LuaDelegate
	{
		public UnityEngine_AudioClip_PCMSetPositionCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_AudioClip_PCMSetPositionCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(int param0)
		{
		}

		public void CallWithSelf(int param0)
		{
		}
	}

	private class UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode_Event : LuaDelegate
	{
		public UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Scene param0, LoadSceneMode param1)
		{
		}

		public void CallWithSelf(Scene param0, LoadSceneMode param1)
		{
		}
	}

	private class UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_Event : LuaDelegate
	{
		public UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Scene param0)
		{
		}

		public void CallWithSelf(Scene param0)
		{
		}
	}

	private class UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_Scene_Event : LuaDelegate
	{
		public UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_Scene_Event(LuaFunction func)
			: base(null)
		{
		}

		public UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_Scene_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Scene param0, Scene param1)
		{
		}

		public void CallWithSelf(Scene param0, Scene param1)
		{
		}
	}

	private class System_Action_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode_Event : LuaDelegate
	{
		public System_Action_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Action_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Scene param0, LoadSceneMode param1)
		{
		}

		public void CallWithSelf(Scene param0, LoadSceneMode param1)
		{
		}
	}

	private class System_Action_UnityEngine_SceneManagement_Scene_Event : LuaDelegate
	{
		public System_Action_UnityEngine_SceneManagement_Scene_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Action_UnityEngine_SceneManagement_Scene_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Scene param0)
		{
		}

		public void CallWithSelf(Scene param0)
		{
		}
	}

	private class UIWidget_OnDimensionsChanged_Event : LuaDelegate
	{
		public UIWidget_OnDimensionsChanged_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIWidget_OnDimensionsChanged_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UIWidget_OnDisPoseFunc_Event : LuaDelegate
	{
		public UIWidget_OnDisPoseFunc_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIWidget_OnDisPoseFunc_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UIWidget_OnPostFillCallback_Event : LuaDelegate
	{
		public UIWidget_OnPostFillCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIWidget_OnPostFillCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(UIWidget param0, int param1, List<Vector3> param2, List<Vector2> param3, List<Color> param4)
		{
		}

		public void CallWithSelf(UIWidget param0, int param1, List<Vector3> param2, List<Vector2> param3, List<Color> param4)
		{
		}
	}

	private class UIDrawCall_OnRenderCallback_Event : LuaDelegate
	{
		public UIDrawCall_OnRenderCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIDrawCall_OnRenderCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Material param0)
		{
		}

		public void CallWithSelf(Material param0)
		{
		}
	}

	private class UIWidget_HitCheck_Event : LuaDelegate
	{
		public UIWidget_HitCheck_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIWidget_HitCheck_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public bool Call(Vector3 param0)
		{
			return false;
		}

		public bool CallWithSelf(Vector3 param0)
		{
			return false;
		}
	}

	private class UICamera_GetKeyStateFunc_Event : LuaDelegate
	{
		public UICamera_GetKeyStateFunc_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_GetKeyStateFunc_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public bool Call(KeyCode param0)
		{
			return false;
		}

		public bool CallWithSelf(KeyCode param0)
		{
			return false;
		}
	}

	private class UICamera_GetAxisFunc_Event : LuaDelegate
	{
		public UICamera_GetAxisFunc_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_GetAxisFunc_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public float Call(string param0)
		{
			return 0f;
		}

		public float CallWithSelf(string param0)
		{
			return 0f;
		}
	}

	private class UICamera_GetAnyKeyFunc_Event : LuaDelegate
	{
		public UICamera_GetAnyKeyFunc_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_GetAnyKeyFunc_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public bool Call()
		{
			return false;
		}

		public bool CallWithSelf()
		{
			return false;
		}
	}

	private class UICamera_GetMouseDelegate_Event : LuaDelegate
	{
		public UICamera_GetMouseDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_GetMouseDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public UICamera.MouseOrTouch Call(int param0)
		{
			return null;
		}

		public UICamera.MouseOrTouch CallWithSelf(int param0)
		{
			return null;
		}
	}

	private class UICamera_GetTouchDelegate_Event : LuaDelegate
	{
		public UICamera_GetTouchDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_GetTouchDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public UICamera.MouseOrTouch Call(int param0, bool param1)
		{
			return null;
		}

		public UICamera.MouseOrTouch CallWithSelf(int param0, bool param1)
		{
			return null;
		}
	}

	private class UICamera_RemoveTouchDelegate_Event : LuaDelegate
	{
		public UICamera_RemoveTouchDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_RemoveTouchDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(int param0)
		{
		}

		public void CallWithSelf(int param0)
		{
		}
	}

	private class UICamera_OnScreenResize_Event : LuaDelegate
	{
		public UICamera_OnScreenResize_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_OnScreenResize_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UICamera_OnCustomInput_Event : LuaDelegate
	{
		public UICamera_OnCustomInput_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_OnCustomInput_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UICamera_OnSchemeChange_Event : LuaDelegate
	{
		public UICamera_OnSchemeChange_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_OnSchemeChange_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UICamera_VoidDelegate_Event : LuaDelegate
	{
		public UICamera_VoidDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_VoidDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0)
		{
		}

		public void CallWithSelf(GameObject param0)
		{
		}
	}

	private class UICamera_BoolDelegate_Event : LuaDelegate
	{
		public UICamera_BoolDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_BoolDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, bool param1)
		{
		}

		public void CallWithSelf(GameObject param0, bool param1)
		{
		}
	}

	private class UICamera_FloatDelegate_Event : LuaDelegate
	{
		public UICamera_FloatDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_FloatDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, float param1)
		{
		}

		public void CallWithSelf(GameObject param0, float param1)
		{
		}
	}

	private class UICamera_VectorDelegate_Event : LuaDelegate
	{
		public UICamera_VectorDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_VectorDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, Vector2 param1)
		{
		}

		public void CallWithSelf(GameObject param0, Vector2 param1)
		{
		}
	}

	private class UICamera_ObjectDelegate_Event : LuaDelegate
	{
		public UICamera_ObjectDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_ObjectDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, GameObject param1)
		{
		}

		public void CallWithSelf(GameObject param0, GameObject param1)
		{
		}
	}

	private class UICamera_KeyCodeDelegate_Event : LuaDelegate
	{
		public UICamera_KeyCodeDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_KeyCodeDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, KeyCode param1)
		{
		}

		public void CallWithSelf(GameObject param0, KeyCode param1)
		{
		}
	}

	private class UICamera_MoveDelegate_Event : LuaDelegate
	{
		public UICamera_MoveDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_MoveDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Vector2 param0)
		{
		}

		public void CallWithSelf(Vector2 param0)
		{
		}
	}

	private class UICamera_GetTouchCountCallback_Event : LuaDelegate
	{
		public UICamera_GetTouchCountCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_GetTouchCountCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public int Call()
		{
			return 0;
		}

		public int CallWithSelf()
		{
			return 0;
		}
	}

	private class UICamera_GetTouchCallback_Event : LuaDelegate
	{
		public UICamera_GetTouchCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICamera_GetTouchCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public UICamera.Touch Call(int param0)
		{
			return null;
		}

		public UICamera.Touch CallWithSelf(int param0)
		{
			return null;
		}
	}

	private class UILabel_ModifierFunc_Event : LuaDelegate
	{
		public UILabel_ModifierFunc_Event(LuaFunction func)
			: base(null)
		{
		}

		public UILabel_ModifierFunc_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public string Call(string param0)
		{
			return null;
		}

		public string CallWithSelf(string param0)
		{
			return null;
		}
	}

	private class UIProgressBar_OnDragFinished_Event : LuaDelegate
	{
		public UIProgressBar_OnDragFinished_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIProgressBar_OnDragFinished_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UIPanel_OnGeometryUpdated_Event : LuaDelegate
	{
		public UIPanel_OnGeometryUpdated_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIPanel_OnGeometryUpdated_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UIPanel_OnClippingMoved_Event : LuaDelegate
	{
		public UIPanel_OnClippingMoved_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIPanel_OnClippingMoved_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(UIPanel param0)
		{
		}

		public void CallWithSelf(UIPanel param0)
		{
		}
	}

	private class UIPanel_OnCreateMaterial_Event : LuaDelegate
	{
		public UIPanel_OnCreateMaterial_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIPanel_OnCreateMaterial_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public Material Call(UIWidget param0, Material param1)
		{
			return null;
		}

		public Material CallWithSelf(UIWidget param0, Material param1)
		{
			return null;
		}
	}

	private class UIDrawCall_OnCreateDrawCall_Event : LuaDelegate
	{
		public UIDrawCall_OnCreateDrawCall_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIDrawCall_OnCreateDrawCall_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(UIDrawCall param0, MeshFilter param1, MeshRenderer param2)
		{
		}

		public void CallWithSelf(UIDrawCall param0, MeshFilter param1, MeshRenderer param2)
		{
		}
	}

	private class UIScrollView_OnDragNotification_Event : LuaDelegate
	{
		public UIScrollView_OnDragNotification_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIScrollView_OnDragNotification_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UIGrid_OnReposition_Event : LuaDelegate
	{
		public UIGrid_OnReposition_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIGrid_OnReposition_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class System_Comparison_UnityEngine_Transform_Event : LuaDelegate
	{
		public System_Comparison_UnityEngine_Transform_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Comparison_UnityEngine_Transform_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public int Call(UnityEngine.Transform param0, UnityEngine.Transform param1)
		{
			return 0;
		}

		public int CallWithSelf(UnityEngine.Transform param0, UnityEngine.Transform param1)
		{
			return 0;
		}
	}

	private class UILayout_OnReposition_Event : LuaDelegate
	{
		public UILayout_OnReposition_Event(LuaFunction func)
			: base(null)
		{
		}

		public UILayout_OnReposition_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class SpringPanel_OnFinished_Event : LuaDelegate
	{
		public SpringPanel_OnFinished_Event(LuaFunction func)
			: base(null)
		{
		}

		public SpringPanel_OnFinished_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UICenterOnChild_OnCenterCallback_Event : LuaDelegate
	{
		public UICenterOnChild_OnCenterCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public UICenterOnChild_OnCenterCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0)
		{
		}

		public void CallWithSelf(GameObject param0)
		{
		}
	}

	private class UIEventListener_VoidDelegate_Event : LuaDelegate
	{
		public UIEventListener_VoidDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIEventListener_VoidDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0)
		{
		}

		public void CallWithSelf(GameObject param0)
		{
		}
	}

	private class UIEventListener_BoolDelegate_Event : LuaDelegate
	{
		public UIEventListener_BoolDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIEventListener_BoolDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, bool param1)
		{
		}

		public void CallWithSelf(GameObject param0, bool param1)
		{
		}
	}

	private class UIEventListener_FloatDelegate_Event : LuaDelegate
	{
		public UIEventListener_FloatDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIEventListener_FloatDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, float param1)
		{
		}

		public void CallWithSelf(GameObject param0, float param1)
		{
		}
	}

	private class UIEventListener_VectorDelegate_Event : LuaDelegate
	{
		public UIEventListener_VectorDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIEventListener_VectorDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, Vector2 param1)
		{
		}

		public void CallWithSelf(GameObject param0, Vector2 param1)
		{
		}
	}

	private class UIEventListener_ObjectDelegate_Event : LuaDelegate
	{
		public UIEventListener_ObjectDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIEventListener_ObjectDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, GameObject param1)
		{
		}

		public void CallWithSelf(GameObject param0, GameObject param1)
		{
		}
	}

	private class UIEventListener_KeyCodeDelegate_Event : LuaDelegate
	{
		public UIEventListener_KeyCodeDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIEventListener_KeyCodeDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, KeyCode param1)
		{
		}

		public void CallWithSelf(GameObject param0, KeyCode param1)
		{
		}
	}

	private class UITable_OnReposition_Event : LuaDelegate
	{
		public UITable_OnReposition_Event(LuaFunction func)
			: base(null)
		{
		}

		public UITable_OnReposition_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class UIInput_OnValidate_Event : LuaDelegate
	{
		public UIInput_OnValidate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIInput_OnValidate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public char Call(string param0, int param1, char param2)
		{
			return '\0';
		}

		public char CallWithSelf(string param0, int param1, char param2)
		{
			return '\0';
		}
	}

	private class UIToggle_Validate_Event : LuaDelegate
	{
		public UIToggle_Validate_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIToggle_Validate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public bool Call(bool param0)
		{
			return false;
		}

		public bool CallWithSelf(bool param0)
		{
			return false;
		}
	}

	private class UIWrapContent_OnInitializeItem_Event : LuaDelegate
	{
		public UIWrapContent_OnInitializeItem_Event(LuaFunction func)
			: base(null)
		{
		}

		public UIWrapContent_OnInitializeItem_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, int param1, int param2)
		{
		}

		public void CallWithSelf(GameObject param0, int param1, int param2)
		{
		}
	}

	private class FlexibleWrapContent_OnInitializeItem_Event : LuaDelegate
	{
		public FlexibleWrapContent_OnInitializeItem_Event(LuaFunction func)
			: base(null)
		{
		}

		public FlexibleWrapContent_OnInitializeItem_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, int param1, int param2)
		{
		}

		public void CallWithSelf(GameObject param0, int param1, int param2)
		{
		}
	}

	private class FlexibleWrapContent_OnScroll_Event : LuaDelegate
	{
		public FlexibleWrapContent_OnScroll_Event(LuaFunction func)
			: base(null)
		{
		}

		public FlexibleWrapContent_OnScroll_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class ResManager_LoadDelegate_Event : LuaDelegate
	{
		public ResManager_LoadDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public ResManager_LoadDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(bool param0, UnityEngine.Object param1, AbstractLoader param2)
		{
		}

		public void CallWithSelf(bool param0, UnityEngine.Object param1, AbstractLoader param2)
		{
		}
	}

	private class ResManager_DownloadDelegate_Event : LuaDelegate
	{
		public ResManager_DownloadDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public ResManager_DownloadDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(DownloadStatus param0)
		{
		}

		public void CallWithSelf(DownloadStatus param0)
		{
		}
	}

	private class ResManager_DownloadGroupProgressDelegate_Event : LuaDelegate
	{
		public ResManager_DownloadGroupProgressDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public ResManager_DownloadGroupProgressDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(float param0)
		{
		}

		public void CallWithSelf(float param0)
		{
		}
	}

	private class ResManager_DownloadProgressDelegate_Event : LuaDelegate
	{
		public ResManager_DownloadProgressDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public ResManager_DownloadProgressDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(DownloadStatus param0, float param1)
		{
		}

		public void CallWithSelf(DownloadStatus param0, float param1)
		{
		}
	}

	private class ResManager_DownloadBytesDelegate_Event : LuaDelegate
	{
		public ResManager_DownloadBytesDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public ResManager_DownloadBytesDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(DownloadStatus param0, byte[] param1)
		{
		}

		public void CallWithSelf(DownloadStatus param0, byte[] param1)
		{
		}
	}

	private class ResManager_DownloadStringDelegate_Event : LuaDelegate
	{
		public ResManager_DownloadStringDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public ResManager_DownloadStringDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(DownloadStatus param0, string param1)
		{
		}

		public void CallWithSelf(DownloadStatus param0, string param1)
		{
		}
	}

	private class HttpRequest_FinishDelegate_Event : LuaDelegate
	{
		public HttpRequest_FinishDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public HttpRequest_FinishDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(HttpResponse param0)
		{
		}

		public void CallWithSelf(HttpResponse param0)
		{
		}
	}

	private class BestHTTP_OnUploadProgressDelegate_Event : LuaDelegate
	{
		public BestHTTP_OnUploadProgressDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public BestHTTP_OnUploadProgressDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(HTTPRequest param0, long param1, long param2)
		{
		}

		public void CallWithSelf(HTTPRequest param0, long param1, long param2)
		{
		}
	}

	private class BestHTTP_OnDownloadProgressDelegate_Event : LuaDelegate
	{
		public BestHTTP_OnDownloadProgressDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public BestHTTP_OnDownloadProgressDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(HTTPRequest param0, long param1, long param2)
		{
		}

		public void CallWithSelf(HTTPRequest param0, long param1, long param2)
		{
		}
	}

	private class BestHTTP_OnRequestFinishedDelegate_Event : LuaDelegate
	{
		public BestHTTP_OnRequestFinishedDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public BestHTTP_OnRequestFinishedDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(HTTPRequest param0, HTTPResponse param1)
		{
		}

		public void CallWithSelf(HTTPRequest param0, HTTPResponse param1)
		{
		}
	}

	private class System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_Event : LuaDelegate
	{
		public System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public bool Call(HTTPRequest param0, X509Certificate param1, X509Chain param2)
		{
			return false;
		}

		public bool CallWithSelf(HTTPRequest param0, X509Certificate param1, X509Chain param2)
		{
			return false;
		}
	}

	private class BestHTTP_OnBeforeRedirectionDelegate_Event : LuaDelegate
	{
		public BestHTTP_OnBeforeRedirectionDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public BestHTTP_OnBeforeRedirectionDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public bool Call(HTTPRequest param0, HTTPResponse param1, Uri param2)
		{
			return false;
		}

		public bool CallWithSelf(HTTPRequest param0, HTTPResponse param1, Uri param2)
		{
			return false;
		}
	}

	private class BestHTTP_OnBeforeHeaderSendDelegate_Event : LuaDelegate
	{
		public BestHTTP_OnBeforeHeaderSendDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public BestHTTP_OnBeforeHeaderSendDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(HTTPRequest param0)
		{
		}

		public void CallWithSelf(HTTPRequest param0)
		{
		}
	}

	private class BestHTTP_OnHeaderEnumerationDelegate_Event : LuaDelegate
	{
		public BestHTTP_OnHeaderEnumerationDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public BestHTTP_OnHeaderEnumerationDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0, List<string> param1)
		{
		}

		public void CallWithSelf(string param0, List<string> param1)
		{
		}
	}

	private class SocketConnection_SocketConnected_Event : LuaDelegate
	{
		public SocketConnection_SocketConnected_Event(LuaFunction func)
			: base(null)
		{
		}

		public SocketConnection_SocketConnected_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(SocketConnection param0)
		{
		}

		public void CallWithSelf(SocketConnection param0)
		{
		}
	}

	private class SocketConnection_SendTimedout_Event : LuaDelegate
	{
		public SocketConnection_SendTimedout_Event(LuaFunction func)
			: base(null)
		{
		}

		public SocketConnection_SendTimedout_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(SocketConnection param0)
		{
		}

		public void CallWithSelf(SocketConnection param0)
		{
		}
	}

	private class SocketConnection_ConnectTimedout_Event : LuaDelegate
	{
		public SocketConnection_ConnectTimedout_Event(LuaFunction func)
			: base(null)
		{
		}

		public SocketConnection_ConnectTimedout_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(SocketConnection param0)
		{
		}

		public void CallWithSelf(SocketConnection param0)
		{
		}
	}

	private class SocketConnection_SocketDisconnected_Event : LuaDelegate
	{
		public SocketConnection_SocketDisconnected_Event(LuaFunction func)
			: base(null)
		{
		}

		public SocketConnection_SocketDisconnected_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(SocketConnection param0)
		{
		}

		public void CallWithSelf(SocketConnection param0)
		{
		}
	}

	private class SocketConnection_SocketError_Event : LuaDelegate
	{
		public SocketConnection_SocketError_Event(LuaFunction func)
			: base(null)
		{
		}

		public SocketConnection_SocketError_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(SocketConnection param0, string param1)
		{
		}

		public void CallWithSelf(SocketConnection param0, string param1)
		{
		}
	}

	private class SocketConnection_SocketMessage_Event : LuaDelegate
	{
		public SocketConnection_SocketMessage_Event(LuaFunction func)
			: base(null)
		{
		}

		public SocketConnection_SocketMessage_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(SocketConnection param0, ushort param1, LuaByteBuffer param2)
		{
		}

		public void CallWithSelf(SocketConnection param0, ushort param1, LuaByteBuffer param2)
		{
		}
	}

	private class LuaAnimationEvent_StringDelegate_Event : LuaDelegate
	{
		public LuaAnimationEvent_StringDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public LuaAnimationEvent_StringDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0)
		{
		}

		public void CallWithSelf(string param0)
		{
		}
	}

	private class LuaParticleEvent_GameObjectDelegate_Event : LuaDelegate
	{
		public LuaParticleEvent_GameObjectDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public LuaParticleEvent_GameObjectDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0)
		{
		}

		public void CallWithSelf(GameObject param0)
		{
		}
	}

	private class ParticleController_CompleteDelegate_Event : LuaDelegate
	{
		public ParticleController_CompleteDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public ParticleController_CompleteDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class XYDSDK_SdkCallback_Event : LuaDelegate
	{
		public XYDSDK_SdkCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public XYDSDK_SdkCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0)
		{
		}

		public void CallWithSelf(string param0)
		{
		}
	}

	private class SheetAnimMesh_AnimNotify_Event : LuaDelegate
	{
		public SheetAnimMesh_AnimNotify_Event(LuaFunction func)
			: base(null)
		{
		}

		public SheetAnimMesh_AnimNotify_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(ESheetMeshAnim param0)
		{
		}

		public void CallWithSelf(ESheetMeshAnim param0)
		{
		}
	}

	private class NGUIDemo_OnLinkClick_Event : LuaDelegate
	{
		public NGUIDemo_OnLinkClick_Event(LuaFunction func)
			: base(null)
		{
		}

		public NGUIDemo_OnLinkClick_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0)
		{
		}

		public void CallWithSelf(string param0)
		{
		}
	}

	private class XYDNotification_NotifyCallback_Event : LuaDelegate
	{
		public XYDNotification_NotifyCallback_Event(LuaFunction func)
			: base(null)
		{
		}

		public XYDNotification_NotifyCallback_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(bool param0)
		{
		}

		public void CallWithSelf(bool param0)
		{
		}
	}

	private class System_Action_string_bytes_Event : LuaDelegate
	{
		public System_Action_string_bytes_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Action_string_bytes_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0, byte[] param1)
		{
		}

		public void CallWithSelf(string param0, byte[] param1)
		{
		}
	}

	private class System_Action_string_Event : LuaDelegate
	{
		public System_Action_string_Event(LuaFunction func)
			: base(null)
		{
		}

		public System_Action_string_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0)
		{
		}

		public void CallWithSelf(string param0)
		{
		}
	}

	private class DragonBones_ListenerDelegate_DragonBones_EventObject_Event : LuaDelegate
	{
		public DragonBones_ListenerDelegate_DragonBones_EventObject_Event(LuaFunction func)
			: base(null)
		{
		}

		public DragonBones_ListenerDelegate_DragonBones_EventObject_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(string param0, DragonBones.EventObject param1)
		{
		}

		public void CallWithSelf(string param0, DragonBones.EventObject param1)
		{
		}
	}

	private class SpineAnim_CompleteDelegate_Event : LuaDelegate
	{
		public SpineAnim_CompleteDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public SpineAnim_CompleteDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class SpineAnim_SpineEventDelegate_Event : LuaDelegate
	{
		public SpineAnim_SpineEventDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public SpineAnim_SpineEventDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Event param0)
		{
		}

		public void CallWithSelf(Event param0)
		{
		}
	}

	private class Spine_Unity_SlotFollower_ColorEventDelegate_Event : LuaDelegate
	{
		public Spine_Unity_SlotFollower_ColorEventDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public Spine_Unity_SlotFollower_ColorEventDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(Color param0)
		{
		}

		public void CallWithSelf(Color param0)
		{
		}
	}

	private class Spine_Unity_SlotFollower_ActiveEventDelegate_Event : LuaDelegate
	{
		public Spine_Unity_SlotFollower_ActiveEventDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public Spine_Unity_SlotFollower_ActiveEventDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(bool param0)
		{
		}

		public void CallWithSelf(bool param0)
		{
		}
	}

	private class DogMainController_CompleteDelegate_Event : LuaDelegate
	{
		public DogMainController_CompleteDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public DogMainController_CompleteDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call()
		{
		}

		public void CallWithSelf()
		{
		}
	}

	private class DogGameBox_CompleteDelegate_Event : LuaDelegate
	{
		public DogGameBox_CompleteDelegate_Event(LuaFunction func)
			: base(null)
		{
		}

		public DogGameBox_CompleteDelegate_Event(LuaFunction func, LuaTable self)
			: base(null)
		{
		}

		public void Call(GameObject param0, int param1, int param2)
		{
		}

		public void CallWithSelf(GameObject param0, int param1, int param2)
		{
		}
	}

	public static Dictionary<Type, DelegateCreate> dict;

	private static DelegateFactory factory;

	public static void Init()
	{
	}

	public static void Register()
	{
	}

	public static Delegate CreateDelegate(Type t, LuaFunction func = null)
	{
		return null;
	}

	public static Delegate CreateDelegate(Type t, LuaFunction func, LuaTable self)
	{
		return null;
	}

	public static Delegate RemoveDelegate(Delegate obj, LuaFunction func)
	{
		return null;
	}

	public static Delegate RemoveDelegate(Delegate obj, Delegate dg)
	{
		return null;
	}

	public Action System_Action(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Action(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Action(IntPtr L, Action o)
	{
	}

	public UnityAction UnityEngine_Events_UnityAction(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_Events_UnityAction(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_Events_UnityAction(IntPtr L, UnityAction o)
	{
	}

	public Predicate<int> System_Predicate_int(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Predicate_int(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Predicate_int(IntPtr L, Predicate<int> o)
	{
	}

	public Action<int> System_Action_int(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Action_int(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Action_int(IntPtr L, Action<int> o)
	{
	}

	public Comparison<int> System_Comparison_int(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Comparison_int(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Comparison_int(IntPtr L, Comparison<int> o)
	{
	}

	public Func<int, int> System_Func_int_int(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Func_int_int(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Func_int_int(IntPtr L, Func<int, int> o)
	{
	}

	public EventDelegate.Callback EventDelegate_Callback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_EventDelegate_Callback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_EventDelegate_Callback(IntPtr L, EventDelegate.Callback o)
	{
	}

	public DOGetter<float> DG_Tweening_Core_DOGetter_float(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_float(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_float(IntPtr L, DOGetter<float> o)
	{
	}

	public DOSetter<float> DG_Tweening_Core_DOSetter_float(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_float(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_float(IntPtr L, DOSetter<float> o)
	{
	}

	public DOGetter<double> DG_Tweening_Core_DOGetter_double(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_double(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_double(IntPtr L, DOGetter<double> o)
	{
	}

	public DOSetter<double> DG_Tweening_Core_DOSetter_double(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_double(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_double(IntPtr L, DOSetter<double> o)
	{
	}

	public DOGetter<int> DG_Tweening_Core_DOGetter_int(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_int(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_int(IntPtr L, DOGetter<int> o)
	{
	}

	public DOSetter<int> DG_Tweening_Core_DOSetter_int(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_int(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_int(IntPtr L, DOSetter<int> o)
	{
	}

	public DOGetter<uint> DG_Tweening_Core_DOGetter_uint(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_uint(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_uint(IntPtr L, DOGetter<uint> o)
	{
	}

	public DOSetter<uint> DG_Tweening_Core_DOSetter_uint(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_uint(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_uint(IntPtr L, DOSetter<uint> o)
	{
	}

	public DOGetter<long> DG_Tweening_Core_DOGetter_long(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_long(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_long(IntPtr L, DOGetter<long> o)
	{
	}

	public DOSetter<long> DG_Tweening_Core_DOSetter_long(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_long(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_long(IntPtr L, DOSetter<long> o)
	{
	}

	public DOGetter<ulong> DG_Tweening_Core_DOGetter_ulong(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_ulong(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_ulong(IntPtr L, DOGetter<ulong> o)
	{
	}

	public DOSetter<ulong> DG_Tweening_Core_DOSetter_ulong(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_ulong(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_ulong(IntPtr L, DOSetter<ulong> o)
	{
	}

	public DOGetter<string> DG_Tweening_Core_DOGetter_string(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_string(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_string(IntPtr L, DOGetter<string> o)
	{
	}

	public DOSetter<string> DG_Tweening_Core_DOSetter_string(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_string(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_string(IntPtr L, DOSetter<string> o)
	{
	}

	public DOGetter<Vector2> DG_Tweening_Core_DOGetter_UnityEngine_Vector2(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_UnityEngine_Vector2(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_UnityEngine_Vector2(IntPtr L, DOGetter<Vector2> o)
	{
	}

	public DOSetter<Vector2> DG_Tweening_Core_DOSetter_UnityEngine_Vector2(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_UnityEngine_Vector2(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_UnityEngine_Vector2(IntPtr L, DOSetter<Vector2> o)
	{
	}

	public DOGetter<Vector3> DG_Tweening_Core_DOGetter_UnityEngine_Vector3(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_UnityEngine_Vector3(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_UnityEngine_Vector3(IntPtr L, DOGetter<Vector3> o)
	{
	}

	public DOSetter<Vector3> DG_Tweening_Core_DOSetter_UnityEngine_Vector3(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_UnityEngine_Vector3(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_UnityEngine_Vector3(IntPtr L, DOSetter<Vector3> o)
	{
	}

	public DOGetter<Vector4> DG_Tweening_Core_DOGetter_UnityEngine_Vector4(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_UnityEngine_Vector4(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_UnityEngine_Vector4(IntPtr L, DOGetter<Vector4> o)
	{
	}

	public DOSetter<Vector4> DG_Tweening_Core_DOSetter_UnityEngine_Vector4(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_UnityEngine_Vector4(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_UnityEngine_Vector4(IntPtr L, DOSetter<Vector4> o)
	{
	}

	public DOGetter<Quaternion> DG_Tweening_Core_DOGetter_UnityEngine_Quaternion(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion(IntPtr L, DOGetter<Quaternion> o)
	{
	}

	public DOSetter<Quaternion> DG_Tweening_Core_DOSetter_UnityEngine_Quaternion(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion(IntPtr L, DOSetter<Quaternion> o)
	{
	}

	public DOGetter<Color> DG_Tweening_Core_DOGetter_UnityEngine_Color(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_UnityEngine_Color(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_UnityEngine_Color(IntPtr L, DOGetter<Color> o)
	{
	}

	public DOSetter<Color> DG_Tweening_Core_DOSetter_UnityEngine_Color(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_UnityEngine_Color(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_UnityEngine_Color(IntPtr L, DOSetter<Color> o)
	{
	}

	public DOGetter<Rect> DG_Tweening_Core_DOGetter_UnityEngine_Rect(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_UnityEngine_Rect(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_UnityEngine_Rect(IntPtr L, DOGetter<Rect> o)
	{
	}

	public DOSetter<Rect> DG_Tweening_Core_DOSetter_UnityEngine_Rect(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_UnityEngine_Rect(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_UnityEngine_Rect(IntPtr L, DOSetter<Rect> o)
	{
	}

	public DOGetter<RectOffset> DG_Tweening_Core_DOGetter_UnityEngine_RectOffset(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset(IntPtr L, DOGetter<RectOffset> o)
	{
	}

	public DOSetter<RectOffset> DG_Tweening_Core_DOSetter_UnityEngine_RectOffset(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset(IntPtr L, DOSetter<RectOffset> o)
	{
	}

	public TweenCallback DG_Tweening_TweenCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_TweenCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_TweenCallback(IntPtr L, TweenCallback o)
	{
	}

	public TweenCallback<int> DG_Tweening_TweenCallback_int(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DG_Tweening_TweenCallback_int(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DG_Tweening_TweenCallback_int(IntPtr L, TweenCallback<int> o)
	{
	}

	public Camera.CameraCallback UnityEngine_Camera_CameraCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_Camera_CameraCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_Camera_CameraCallback(IntPtr L, Camera.CameraCallback o)
	{
	}

	public Application.AdvertisingIdentifierCallback UnityEngine_Application_AdvertisingIdentifierCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_Application_AdvertisingIdentifierCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_Application_AdvertisingIdentifierCallback(IntPtr L, Application.AdvertisingIdentifierCallback o)
	{
	}

	public Application.LowMemoryCallback UnityEngine_Application_LowMemoryCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_Application_LowMemoryCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_Application_LowMemoryCallback(IntPtr L, Application.LowMemoryCallback o)
	{
	}

	public Application.LogCallback UnityEngine_Application_LogCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_Application_LogCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_Application_LogCallback(IntPtr L, Application.LogCallback o)
	{
	}

	public Action<bool> System_Action_bool(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Action_bool(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Action_bool(IntPtr L, Action<bool> o)
	{
	}

	public Func<bool> System_Func_bool(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Func_bool(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Func_bool(IntPtr L, Func<bool> o)
	{
	}

	public AudioClip.PCMReaderCallback UnityEngine_AudioClip_PCMReaderCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_AudioClip_PCMReaderCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_AudioClip_PCMReaderCallback(IntPtr L, AudioClip.PCMReaderCallback o)
	{
	}

	public AudioClip.PCMSetPositionCallback UnityEngine_AudioClip_PCMSetPositionCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_AudioClip_PCMSetPositionCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_AudioClip_PCMSetPositionCallback(IntPtr L, AudioClip.PCMSetPositionCallback o)
	{
	}

	public UnityAction<Scene, LoadSceneMode> UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode(IntPtr L, UnityAction<Scene, LoadSceneMode> o)
	{
	}

	public UnityAction<Scene> UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene(IntPtr L, UnityAction<Scene> o)
	{
	}

	public UnityAction<Scene, Scene> UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_Scene(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_Scene(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UnityEngine_Events_UnityAction_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_Scene(IntPtr L, UnityAction<Scene, Scene> o)
	{
	}

	public Action<Scene, LoadSceneMode> System_Action_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Action_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Action_UnityEngine_SceneManagement_Scene_UnityEngine_SceneManagement_LoadSceneMode(IntPtr L, Action<Scene, LoadSceneMode> o)
	{
	}

	public Action<Scene> System_Action_UnityEngine_SceneManagement_Scene(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Action_UnityEngine_SceneManagement_Scene(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Action_UnityEngine_SceneManagement_Scene(IntPtr L, Action<Scene> o)
	{
	}

	public UIWidget.OnDimensionsChanged UIWidget_OnDimensionsChanged(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIWidget_OnDimensionsChanged(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIWidget_OnDimensionsChanged(IntPtr L, UIWidget.OnDimensionsChanged o)
	{
	}

	public UIWidget.OnDisPoseFunc UIWidget_OnDisPoseFunc(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIWidget_OnDisPoseFunc(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIWidget_OnDisPoseFunc(IntPtr L, UIWidget.OnDisPoseFunc o)
	{
	}

	public UIWidget.OnPostFillCallback UIWidget_OnPostFillCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIWidget_OnPostFillCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIWidget_OnPostFillCallback(IntPtr L, UIWidget.OnPostFillCallback o)
	{
	}

	public UIDrawCall.OnRenderCallback UIDrawCall_OnRenderCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIDrawCall_OnRenderCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIDrawCall_OnRenderCallback(IntPtr L, UIDrawCall.OnRenderCallback o)
	{
	}

	public UIWidget.HitCheck UIWidget_HitCheck(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIWidget_HitCheck(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIWidget_HitCheck(IntPtr L, UIWidget.HitCheck o)
	{
	}

	public UICamera.GetKeyStateFunc UICamera_GetKeyStateFunc(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_GetKeyStateFunc(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_GetKeyStateFunc(IntPtr L, UICamera.GetKeyStateFunc o)
	{
	}

	public UICamera.GetAxisFunc UICamera_GetAxisFunc(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_GetAxisFunc(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_GetAxisFunc(IntPtr L, UICamera.GetAxisFunc o)
	{
	}

	public UICamera.GetAnyKeyFunc UICamera_GetAnyKeyFunc(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_GetAnyKeyFunc(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_GetAnyKeyFunc(IntPtr L, UICamera.GetAnyKeyFunc o)
	{
	}

	public UICamera.GetMouseDelegate UICamera_GetMouseDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_GetMouseDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_GetMouseDelegate(IntPtr L, UICamera.GetMouseDelegate o)
	{
	}

	public UICamera.GetTouchDelegate UICamera_GetTouchDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_GetTouchDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_GetTouchDelegate(IntPtr L, UICamera.GetTouchDelegate o)
	{
	}

	public UICamera.RemoveTouchDelegate UICamera_RemoveTouchDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_RemoveTouchDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_RemoveTouchDelegate(IntPtr L, UICamera.RemoveTouchDelegate o)
	{
	}

	public UICamera.OnScreenResize UICamera_OnScreenResize(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_OnScreenResize(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_OnScreenResize(IntPtr L, UICamera.OnScreenResize o)
	{
	}

	public UICamera.OnCustomInput UICamera_OnCustomInput(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_OnCustomInput(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_OnCustomInput(IntPtr L, UICamera.OnCustomInput o)
	{
	}

	public UICamera.OnSchemeChange UICamera_OnSchemeChange(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_OnSchemeChange(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_OnSchemeChange(IntPtr L, UICamera.OnSchemeChange o)
	{
	}

	public UICamera.VoidDelegate UICamera_VoidDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_VoidDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_VoidDelegate(IntPtr L, UICamera.VoidDelegate o)
	{
	}

	public UICamera.BoolDelegate UICamera_BoolDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_BoolDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_BoolDelegate(IntPtr L, UICamera.BoolDelegate o)
	{
	}

	public UICamera.FloatDelegate UICamera_FloatDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_FloatDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_FloatDelegate(IntPtr L, UICamera.FloatDelegate o)
	{
	}

	public UICamera.VectorDelegate UICamera_VectorDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_VectorDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_VectorDelegate(IntPtr L, UICamera.VectorDelegate o)
	{
	}

	public UICamera.ObjectDelegate UICamera_ObjectDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_ObjectDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_ObjectDelegate(IntPtr L, UICamera.ObjectDelegate o)
	{
	}

	public UICamera.KeyCodeDelegate UICamera_KeyCodeDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_KeyCodeDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_KeyCodeDelegate(IntPtr L, UICamera.KeyCodeDelegate o)
	{
	}

	public UICamera.MoveDelegate UICamera_MoveDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_MoveDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_MoveDelegate(IntPtr L, UICamera.MoveDelegate o)
	{
	}

	public UICamera.GetTouchCountCallback UICamera_GetTouchCountCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_GetTouchCountCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_GetTouchCountCallback(IntPtr L, UICamera.GetTouchCountCallback o)
	{
	}

	public UICamera.GetTouchCallback UICamera_GetTouchCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICamera_GetTouchCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICamera_GetTouchCallback(IntPtr L, UICamera.GetTouchCallback o)
	{
	}

	public UILabel.ModifierFunc UILabel_ModifierFunc(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UILabel_ModifierFunc(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UILabel_ModifierFunc(IntPtr L, UILabel.ModifierFunc o)
	{
	}

	public UIProgressBar.OnDragFinished UIProgressBar_OnDragFinished(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIProgressBar_OnDragFinished(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIProgressBar_OnDragFinished(IntPtr L, UIProgressBar.OnDragFinished o)
	{
	}

	public UIPanel.OnGeometryUpdated UIPanel_OnGeometryUpdated(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIPanel_OnGeometryUpdated(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIPanel_OnGeometryUpdated(IntPtr L, UIPanel.OnGeometryUpdated o)
	{
	}

	public UIPanel.OnClippingMoved UIPanel_OnClippingMoved(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIPanel_OnClippingMoved(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIPanel_OnClippingMoved(IntPtr L, UIPanel.OnClippingMoved o)
	{
	}

	public UIPanel.OnCreateMaterial UIPanel_OnCreateMaterial(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIPanel_OnCreateMaterial(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIPanel_OnCreateMaterial(IntPtr L, UIPanel.OnCreateMaterial o)
	{
	}

	public UIDrawCall.OnCreateDrawCall UIDrawCall_OnCreateDrawCall(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIDrawCall_OnCreateDrawCall(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIDrawCall_OnCreateDrawCall(IntPtr L, UIDrawCall.OnCreateDrawCall o)
	{
	}

	public UIScrollView.OnDragNotification UIScrollView_OnDragNotification(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIScrollView_OnDragNotification(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIScrollView_OnDragNotification(IntPtr L, UIScrollView.OnDragNotification o)
	{
	}

	public UIGrid.OnReposition UIGrid_OnReposition(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIGrid_OnReposition(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIGrid_OnReposition(IntPtr L, UIGrid.OnReposition o)
	{
	}

	public Comparison<UnityEngine.Transform> System_Comparison_UnityEngine_Transform(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Comparison_UnityEngine_Transform(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Comparison_UnityEngine_Transform(IntPtr L, Comparison<UnityEngine.Transform> o)
	{
	}

	public UILayout.OnReposition UILayout_OnReposition(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UILayout_OnReposition(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UILayout_OnReposition(IntPtr L, UILayout.OnReposition o)
	{
	}

	public SpringPanel.OnFinished SpringPanel_OnFinished(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SpringPanel_OnFinished(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SpringPanel_OnFinished(IntPtr L, SpringPanel.OnFinished o)
	{
	}

	public UICenterOnChild.OnCenterCallback UICenterOnChild_OnCenterCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UICenterOnChild_OnCenterCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UICenterOnChild_OnCenterCallback(IntPtr L, UICenterOnChild.OnCenterCallback o)
	{
	}

	public UIEventListener.VoidDelegate UIEventListener_VoidDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIEventListener_VoidDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIEventListener_VoidDelegate(IntPtr L, UIEventListener.VoidDelegate o)
	{
	}

	public UIEventListener.BoolDelegate UIEventListener_BoolDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIEventListener_BoolDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIEventListener_BoolDelegate(IntPtr L, UIEventListener.BoolDelegate o)
	{
	}

	public UIEventListener.FloatDelegate UIEventListener_FloatDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIEventListener_FloatDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIEventListener_FloatDelegate(IntPtr L, UIEventListener.FloatDelegate o)
	{
	}

	public UIEventListener.VectorDelegate UIEventListener_VectorDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIEventListener_VectorDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIEventListener_VectorDelegate(IntPtr L, UIEventListener.VectorDelegate o)
	{
	}

	public UIEventListener.ObjectDelegate UIEventListener_ObjectDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIEventListener_ObjectDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIEventListener_ObjectDelegate(IntPtr L, UIEventListener.ObjectDelegate o)
	{
	}

	public UIEventListener.KeyCodeDelegate UIEventListener_KeyCodeDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIEventListener_KeyCodeDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIEventListener_KeyCodeDelegate(IntPtr L, UIEventListener.KeyCodeDelegate o)
	{
	}

	public UITable.OnReposition UITable_OnReposition(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UITable_OnReposition(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UITable_OnReposition(IntPtr L, UITable.OnReposition o)
	{
	}

	public UIInput.OnValidate UIInput_OnValidate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIInput_OnValidate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIInput_OnValidate(IntPtr L, UIInput.OnValidate o)
	{
	}

	public UIToggle.Validate UIToggle_Validate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIToggle_Validate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIToggle_Validate(IntPtr L, UIToggle.Validate o)
	{
	}

	public UIWrapContent.OnInitializeItem UIWrapContent_OnInitializeItem(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_UIWrapContent_OnInitializeItem(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_UIWrapContent_OnInitializeItem(IntPtr L, UIWrapContent.OnInitializeItem o)
	{
	}

	public FlexibleWrapContent.OnInitializeItem FlexibleWrapContent_OnInitializeItem(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_FlexibleWrapContent_OnInitializeItem(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_FlexibleWrapContent_OnInitializeItem(IntPtr L, FlexibleWrapContent.OnInitializeItem o)
	{
	}

	public FlexibleWrapContent.OnScroll FlexibleWrapContent_OnScroll(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_FlexibleWrapContent_OnScroll(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_FlexibleWrapContent_OnScroll(IntPtr L, FlexibleWrapContent.OnScroll o)
	{
	}

	public ResManager.LoadDelegate ResManager_LoadDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_ResManager_LoadDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_ResManager_LoadDelegate(IntPtr L, ResManager.LoadDelegate o)
	{
	}

	public ResManager.DownloadDelegate ResManager_DownloadDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_ResManager_DownloadDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_ResManager_DownloadDelegate(IntPtr L, ResManager.DownloadDelegate o)
	{
	}

	public ResManager.DownloadGroupProgressDelegate ResManager_DownloadGroupProgressDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_ResManager_DownloadGroupProgressDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_ResManager_DownloadGroupProgressDelegate(IntPtr L, ResManager.DownloadGroupProgressDelegate o)
	{
	}

	public ResManager.DownloadProgressDelegate ResManager_DownloadProgressDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_ResManager_DownloadProgressDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_ResManager_DownloadProgressDelegate(IntPtr L, ResManager.DownloadProgressDelegate o)
	{
	}

	public ResManager.DownloadBytesDelegate ResManager_DownloadBytesDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_ResManager_DownloadBytesDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_ResManager_DownloadBytesDelegate(IntPtr L, ResManager.DownloadBytesDelegate o)
	{
	}

	public ResManager.DownloadStringDelegate ResManager_DownloadStringDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_ResManager_DownloadStringDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_ResManager_DownloadStringDelegate(IntPtr L, ResManager.DownloadStringDelegate o)
	{
	}

	public HttpRequest.FinishDelegate HttpRequest_FinishDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_HttpRequest_FinishDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_HttpRequest_FinishDelegate(IntPtr L, HttpRequest.FinishDelegate o)
	{
	}

	public OnUploadProgressDelegate BestHTTP_OnUploadProgressDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_BestHTTP_OnUploadProgressDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_BestHTTP_OnUploadProgressDelegate(IntPtr L, OnUploadProgressDelegate o)
	{
	}

	public OnDownloadProgressDelegate BestHTTP_OnDownloadProgressDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_BestHTTP_OnDownloadProgressDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_BestHTTP_OnDownloadProgressDelegate(IntPtr L, OnDownloadProgressDelegate o)
	{
	}

	public OnRequestFinishedDelegate BestHTTP_OnRequestFinishedDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_BestHTTP_OnRequestFinishedDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_BestHTTP_OnRequestFinishedDelegate(IntPtr L, OnRequestFinishedDelegate o)
	{
	}

	public Func<HTTPRequest, X509Certificate, X509Chain, bool> System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool(IntPtr L, Func<HTTPRequest, X509Certificate, X509Chain, bool> o)
	{
	}

	public OnBeforeRedirectionDelegate BestHTTP_OnBeforeRedirectionDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_BestHTTP_OnBeforeRedirectionDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_BestHTTP_OnBeforeRedirectionDelegate(IntPtr L, OnBeforeRedirectionDelegate o)
	{
	}

	public OnBeforeHeaderSendDelegate BestHTTP_OnBeforeHeaderSendDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_BestHTTP_OnBeforeHeaderSendDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_BestHTTP_OnBeforeHeaderSendDelegate(IntPtr L, OnBeforeHeaderSendDelegate o)
	{
	}

	public OnHeaderEnumerationDelegate BestHTTP_OnHeaderEnumerationDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_BestHTTP_OnHeaderEnumerationDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_BestHTTP_OnHeaderEnumerationDelegate(IntPtr L, OnHeaderEnumerationDelegate o)
	{
	}

	public SocketConnection.SocketConnected SocketConnection_SocketConnected(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SocketConnection_SocketConnected(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SocketConnection_SocketConnected(IntPtr L, SocketConnection.SocketConnected o)
	{
	}

	public SocketConnection.SendTimedout SocketConnection_SendTimedout(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SocketConnection_SendTimedout(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SocketConnection_SendTimedout(IntPtr L, SocketConnection.SendTimedout o)
	{
	}

	public SocketConnection.ConnectTimedout SocketConnection_ConnectTimedout(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SocketConnection_ConnectTimedout(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SocketConnection_ConnectTimedout(IntPtr L, SocketConnection.ConnectTimedout o)
	{
	}

	public SocketConnection.SocketDisconnected SocketConnection_SocketDisconnected(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SocketConnection_SocketDisconnected(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SocketConnection_SocketDisconnected(IntPtr L, SocketConnection.SocketDisconnected o)
	{
	}

	public SocketConnection.SocketError SocketConnection_SocketError(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SocketConnection_SocketError(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SocketConnection_SocketError(IntPtr L, SocketConnection.SocketError o)
	{
	}

	public SocketConnection.SocketMessage SocketConnection_SocketMessage(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SocketConnection_SocketMessage(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SocketConnection_SocketMessage(IntPtr L, SocketConnection.SocketMessage o)
	{
	}

	public LuaAnimationEvent.StringDelegate LuaAnimationEvent_StringDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_LuaAnimationEvent_StringDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_LuaAnimationEvent_StringDelegate(IntPtr L, LuaAnimationEvent.StringDelegate o)
	{
	}

	public LuaParticleEvent.GameObjectDelegate LuaParticleEvent_GameObjectDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_LuaParticleEvent_GameObjectDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_LuaParticleEvent_GameObjectDelegate(IntPtr L, LuaParticleEvent.GameObjectDelegate o)
	{
	}

	public ParticleController.CompleteDelegate ParticleController_CompleteDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_ParticleController_CompleteDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_ParticleController_CompleteDelegate(IntPtr L, ParticleController.CompleteDelegate o)
	{
	}

	public XYDSDK.SdkCallback XYDSDK_SdkCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_XYDSDK_SdkCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_XYDSDK_SdkCallback(IntPtr L, XYDSDK.SdkCallback o)
	{
	}

	public SheetAnimMesh.AnimNotify SheetAnimMesh_AnimNotify(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SheetAnimMesh_AnimNotify(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SheetAnimMesh_AnimNotify(IntPtr L, SheetAnimMesh.AnimNotify o)
	{
	}

	public NGUIDemo.OnLinkClick NGUIDemo_OnLinkClick(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_NGUIDemo_OnLinkClick(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_NGUIDemo_OnLinkClick(IntPtr L, NGUIDemo.OnLinkClick o)
	{
	}

	public XYDNotification.NotifyCallback XYDNotification_NotifyCallback(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_XYDNotification_NotifyCallback(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_XYDNotification_NotifyCallback(IntPtr L, XYDNotification.NotifyCallback o)
	{
	}

	public Action<string, byte[]> System_Action_string_bytes(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Action_string_bytes(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Action_string_bytes(IntPtr L, Action<string, byte[]> o)
	{
	}

	public Action<string> System_Action_string(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_System_Action_string(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_System_Action_string(IntPtr L, Action<string> o)
	{
	}

	public ListenerDelegate<DragonBones.EventObject> DragonBones_ListenerDelegate_DragonBones_EventObject(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DragonBones_ListenerDelegate_DragonBones_EventObject(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DragonBones_ListenerDelegate_DragonBones_EventObject(IntPtr L, ListenerDelegate<DragonBones.EventObject> o)
	{
	}

	public SpineAnim.CompleteDelegate SpineAnim_CompleteDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SpineAnim_CompleteDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SpineAnim_CompleteDelegate(IntPtr L, SpineAnim.CompleteDelegate o)
	{
	}

	public SpineAnim.SpineEventDelegate SpineAnim_SpineEventDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_SpineAnim_SpineEventDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_SpineAnim_SpineEventDelegate(IntPtr L, SpineAnim.SpineEventDelegate o)
	{
	}

	public SlotFollower.ColorEventDelegate Spine_Unity_SlotFollower_ColorEventDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_Spine_Unity_SlotFollower_ColorEventDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_Spine_Unity_SlotFollower_ColorEventDelegate(IntPtr L, SlotFollower.ColorEventDelegate o)
	{
	}

	public SlotFollower.ActiveEventDelegate Spine_Unity_SlotFollower_ActiveEventDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_Spine_Unity_SlotFollower_ActiveEventDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_Spine_Unity_SlotFollower_ActiveEventDelegate(IntPtr L, SlotFollower.ActiveEventDelegate o)
	{
	}

	public DogMainController.CompleteDelegate DogMainController_CompleteDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DogMainController_CompleteDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DogMainController_CompleteDelegate(IntPtr L, DogMainController.CompleteDelegate o)
	{
	}

	public DogGameBox.CompleteDelegate DogGameBox_CompleteDelegate(LuaFunction func, LuaTable self, bool flag)
	{
		return null;
	}

	private bool Check_DogGameBox_CompleteDelegate(IntPtr L, int pos)
	{
		return false;
	}

	private void Push_DogGameBox_CompleteDelegate(IntPtr L, DogGameBox.CompleteDelegate o)
	{
	}
}
