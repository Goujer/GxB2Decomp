using System;
using LuaInterface;

public class DontDestroyOnLoadWrap
{
	public static void Register(LuaState L)
	{
	}

	private static int op_Equality(IntPtr L)
	{
		return 0;
	}
}
