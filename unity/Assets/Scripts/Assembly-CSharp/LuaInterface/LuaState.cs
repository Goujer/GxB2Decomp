using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace LuaInterface
{
	public class LuaState : LuaStatePtr, IDisposable
	{
		public ObjectTranslator translator;

		public LuaReflection reflection;

		private const string __G__TRACKBACK_ERROR__ = "\r\n            function __G__TRACKBACK_ERROR__(prefix, message, stackTrace)\r\n                print('----------------------------------------')\r\n                print(prefix .. tostring(message) .. '\\n' .. tostring(stackTrace) .. '\\n')\r\n            end";

		private const string __G__TRACKBACK_CRASH__ = "\r\n            function __G__TRACKBACK_CRASH__(path, stackTrace)\r\n                print('----------------------------------------')\r\n                print('CRASH: ' .. tostring(path) .. '\\n' .. tostring(stackTrace) .. '\\n')\r\n            end";

		public Action OnDestroy;

		private Dictionary<string, WeakReference> funcMap;

		private Dictionary<int, WeakReference> funcRefMap;

		private Dictionary<long, WeakReference> delegateMap;

		private List<GCRef> gcList;

		private List<LuaBaseRef> subList;

		private Dictionary<Type, int> metaMap;

		private Dictionary<Enum, object> enumMap;

		private Dictionary<Type, LuaCSFunction> preLoadMap;

		private Dictionary<int, Type> typeMap;

		private HashSet<Type> genericSet;

		private HashSet<string> moduleSet;

		private static LuaState mainState;

		private static Dictionary<IntPtr, LuaState> stateMap;

		private int beginCount;

		private bool beLogGC;

		private HashSet<Type> missSet;

		public int ArrayMetatable { get; private set; }

		public int DelegateMetatable { get; private set; }

		public int TypeMetatable { get; private set; }

		public int EnumMetatable { get; private set; }

		public int IterMetatable { get; private set; }

		public int EventMetatable { get; private set; }

		public int PackBounds { get; private set; }

		public int UnpackBounds { get; private set; }

		public int PackRay { get; private set; }

		public int UnpackRay { get; private set; }

		public int PackRaycastHit { get; private set; }

		public int PackTouch { get; private set; }

		public bool LogGC
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public object Item
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		private void OpenBaseLibs()
		{
		}

		private void InitLuaPath()
		{
		}

		private void OpenBaseLuaLibs()
		{
		}

		public void Start()
		{
		}

		public int OpenLibs(LuaCSFunction open)
		{
			return 0;
		}

		public void BeginPreLoad()
		{
		}

		public void EndPreLoad()
		{
		}

		public void AddPreLoad(string name, LuaCSFunction func, Type type)
		{
		}

		public void AddPreLoad(string name, LuaCSFunction func)
		{
		}

		public int BeginPreModule(string name)
		{
			return 0;
		}

		public void EndPreModule(int reference)
		{
		}

		public void EndPreModule(IntPtr L, int reference)
		{
		}

		public void BindPreModule(Type t, LuaCSFunction func)
		{
		}

		public LuaCSFunction GetPreModule(Type t)
		{
			return null;
		}

		public bool BeginModule(string name)
		{
			return false;
		}

		public void EndModule()
		{
		}

		private void BindTypeRef(int reference, Type t)
		{
		}

		public Type GetClassType(int reference)
		{
			return null;
		}

		public static int Collect(IntPtr L)
		{
			return 0;
		}

		private string GetToLuaTypeName(Type t)
		{
			return null;
		}

		public int BeginClass(Type t, Type baseType, string name = null)
		{
			return 0;
		}

		public void EndClass()
		{
		}

		public int BeginEnum(Type t)
		{
			return 0;
		}

		public void EndEnum()
		{
		}

		public void BeginStaticLibs(string name)
		{
		}

		public void EndStaticLibs()
		{
		}

		public void RegFunction(string name, LuaCSFunction func)
		{
		}

		public void RegVar(string name, LuaCSFunction get, LuaCSFunction set)
		{
		}

		public void RegConstant(string name, double d)
		{
		}

		public void RegConstant(string name, bool flag)
		{
		}

		private int GetFuncRef(string name)
		{
			return 0;
		}

		public static LuaState Get(IntPtr ptr)
		{
			return null;
		}

		public static ObjectTranslator GetTranslator(IntPtr ptr)
		{
			return null;
		}

		public static LuaReflection GetReflection(IntPtr ptr)
		{
			return null;
		}

		public void DoString(string chunk, string chunkName = "LuaState.cs")
		{
		}

		public T DoString<T>(string chunk, string chunkName = "LuaState.cs")
		{
			return default(T);
		}

		private byte[] LoadFileBuffer(string fileName)
		{
			return null;
		}

		private string LuaChunkName(string name)
		{
			return null;
		}

		public void DoFile(string fileName)
		{
		}

		public T DoFile<T>(string fileName)
		{
			return default(T);
		}

		public void Require(string fileName)
		{
		}

		public T Require<T>(string fileName)
		{
			return default(T);
		}

		public void InitPackagePath()
		{
		}

		private string ToPackagePath(string path)
		{
			return null;
		}

		public void AddSearchPath(string fullPath)
		{
		}

		public void RemoveSeachPath(string fullPath)
		{
		}

		public int BeginPCall(int reference)
		{
			return 0;
		}

		public void PCall(int args, int oldTop)
		{
		}

		public void EndPCall(int oldTop)
		{
		}

		public void PushArgs(object[] args)
		{
		}

		private void CheckNull(LuaBaseRef lbr, string fmt, object arg0)
		{
		}

		private bool PushLuaTable(string fullPath, bool checkMap = true)
		{
			return false;
		}

		private bool PushLuaFunction(string fullPath, bool checkMap = true)
		{
			return false;
		}

		private void RemoveFromGCList(int reference)
		{
		}

		public LuaFunction GetFunction(string name, bool beLogMiss = true)
		{
			return null;
		}

		private LuaBaseRef TryGetLuaRef(int reference)
		{
			return null;
		}

		public LuaFunction GetFunction(int reference)
		{
			return null;
		}

		public LuaTable GetTable(string fullPath, bool beLogMiss = true)
		{
			return null;
		}

		public LuaTable GetTable(int reference)
		{
			return null;
		}

		public LuaThread GetLuaThread(int reference)
		{
			return null;
		}

		public LuaDelegate GetLuaDelegate(LuaFunction func)
		{
			return null;
		}

		public LuaDelegate GetLuaDelegate(LuaFunction func, LuaTable self)
		{
			return null;
		}

		public void AddLuaDelegate(LuaDelegate target, LuaFunction func)
		{
		}

		public void AddLuaDelegate(LuaDelegate target, LuaFunction func, LuaTable self)
		{
		}

		public bool CheckTop()
		{
			return false;
		}

		public void Push(bool b)
		{
		}

		public void Push(double d)
		{
		}

		public void Push(uint un)
		{
		}

		public void Push(int n)
		{
		}

		public void Push(short s)
		{
		}

		public void Push(ushort us)
		{
		}

		public void Push(long l)
		{
		}

		public void Push(ulong ul)
		{
		}

		public void Push(string str)
		{
		}

		public void Push(IntPtr p)
		{
		}

		public void Push(Vector3 v3)
		{
		}

		public void Push(Vector2 v2)
		{
		}

		public void Push(Vector4 v4)
		{
		}

		public void Push(Color clr)
		{
		}

		public void Push(Quaternion q)
		{
		}

		public void Push(Ray ray)
		{
		}

		public void Push(Bounds bound)
		{
		}

		public void Push(RaycastHit hit)
		{
		}

		public void Push(Touch touch)
		{
		}

		public void PushLayerMask(LayerMask mask)
		{
		}

		public void Push(LuaByteBuffer bb)
		{
		}

		public void PushByteBuffer(byte[] buffer)
		{
		}

		public void PushByteBuffer(byte[] buffer, int len)
		{
		}

		public void Push(LuaBaseRef lbr)
		{
		}

		private void PushUserData(object o, int reference)
		{
		}

		public void Push(Array array)
		{
		}

		public void Push(Type t)
		{
		}

		public void Push(Delegate ev)
		{
		}

		public object GetEnumObj(Enum e)
		{
			return null;
		}

		public void Push(Enum e)
		{
		}

		public void Push(IEnumerator iter)
		{
		}

		public void Push(UnityEngine.Object obj)
		{
		}

		public void Push(TrackedReference tracker)
		{
		}

		public void PushVariant(object obj)
		{
		}

		public void PushObject(object obj)
		{
		}

		public void PushSealed<T>(T o)
		{
		}

		public void PushValue<T>(T v) where T : struct
		{
		}

		public void PushGeneric<T>(T o)
		{
		}

		private Vector3 ToVector3(int stackPos)
		{
			return default(Vector3);
		}

		public Vector3 CheckVector3(int stackPos)
		{
			return default(Vector3);
		}

		public Quaternion CheckQuaternion(int stackPos)
		{
			return default(Quaternion);
		}

		public Vector2 CheckVector2(int stackPos)
		{
			return default(Vector2);
		}

		public Vector4 CheckVector4(int stackPos)
		{
			return default(Vector4);
		}

		public Color CheckColor(int stackPos)
		{
			return default(Color);
		}

		public Ray CheckRay(int stackPos)
		{
			return default(Ray);
		}

		public Bounds CheckBounds(int stackPos)
		{
			return default(Bounds);
		}

		public LayerMask CheckLayerMask(int stackPos)
		{
			return default(LayerMask);
		}

		public long CheckLong(int stackPos)
		{
			return 0L;
		}

		public ulong CheckULong(int stackPos)
		{
			return 0uL;
		}

		public string CheckString(int stackPos)
		{
			return null;
		}

		public Delegate CheckDelegate(int stackPos)
		{
			return null;
		}

		public char[] CheckCharBuffer(int stackPos)
		{
			return null;
		}

		public byte[] CheckByteBuffer(int stackPos)
		{
			return null;
		}

		public T[] CheckNumberArray<T>(int stackPos) where T : struct
		{
			return null;
		}

		public object CheckObject(int stackPos, Type type)
		{
			return null;
		}

		public object CheckVarObject(int stackPos, Type type)
		{
			return null;
		}

		public object[] CheckObjects(int oldTop)
		{
			return null;
		}

		public LuaFunction CheckLuaFunction(int stackPos)
		{
			return null;
		}

		public LuaTable CheckLuaTable(int stackPos)
		{
			return null;
		}

		public LuaThread CheckLuaThread(int stackPos)
		{
			return null;
		}

		public T CheckValue<T>(int stackPos)
		{
			return default(T);
		}

		public object ToVariant(int stackPos)
		{
			return null;
		}

		public void CollectRef(int reference, string name, bool isGCThread = false)
		{
		}

		public void DelayDispose(LuaBaseRef br)
		{
		}

		public int Collect()
		{
			return 0;
		}

		public void RefreshDelegateMap()
		{
		}

		public void NewTable(string fullPath)
		{
		}

		public LuaTable NewTable(int narr = 0, int nrec = 0)
		{
			return null;
		}

		public void ReLoad(string moduleFileName)
		{
		}

		public int GetMetaReference(Type t)
		{
			return 0;
		}

		public int GetMissMetaReference(Type t)
		{
			return 0;
		}

		private Type GetBaseType(Type t)
		{
			return null;
		}

		private Type GetSpecialGenericType(Type t)
		{
			return null;
		}

		private void CloseBaseRef()
		{
		}

		public void Dispose()
		{
		}

		public override int GetHashCode()
		{
			return 0;
		}

		public override bool Equals(object o)
		{
			return false;
		}

		public static bool operator ==(LuaState a, LuaState b)
		{
			return false;
		}

		public static bool operator !=(LuaState a, LuaState b)
		{
			return false;
		}

		public void PrintTable(string name)
		{
		}

		protected void Collect(int reference, string name, bool beThread)
		{
		}

		protected void LuaLoadBuffer(byte[] buffer, string chunkName)
		{
		}

		protected T LuaLoadBuffer<T>(byte[] buffer, string chunkName)
		{
			return default(T);
		}

		public bool BeginCall(string name, int top, bool beLogMiss)
		{
			return false;
		}

		public void Call(int nArgs, int errfunc, int top)
		{
		}

		public void Call(string name, bool beLogMiss)
		{
		}

		public void Call<T>(string name, T arg1, bool beLogMiss)
		{
		}

		public void Call<T1, T2>(string name, T1 arg1, T2 arg2, bool beLogMiss)
		{
		}

		public void Call<T1, T2, T3>(string name, T1 arg1, T2 arg2, T3 arg3, bool beLogMiss)
		{
		}

		public void Call<T1, T2, T3, T4>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, bool beLogMiss)
		{
		}

		public void Call<T1, T2, T3, T4, T5>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, bool beLogMiss)
		{
		}

		public void Call<T1, T2, T3, T4, T5, T6>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, bool beLogMiss)
		{
		}

		public R1 Invoke<R1>(string name, bool beLogMiss)
		{
			return default(R1);
		}

		public R1 Invoke<T1, R1>(string name, T1 arg1, bool beLogMiss)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, R1>(string name, T1 arg1, T2 arg2, bool beLogMiss)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, R1>(string name, T1 arg1, T2 arg2, T3 arg3, bool beLogMiss)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, R1>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, bool beLogMiss)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, T5, R1>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, bool beLogMiss)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, T5, T6, R1>(string name, T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, bool beLogMiss)
		{
			return default(R1);
		}

		private void InitTypeTraits()
		{
		}

		private void InitStackTraits()
		{
		}

		public string GetCrashStackTrace()
		{
			return null;
		}
	}
}
