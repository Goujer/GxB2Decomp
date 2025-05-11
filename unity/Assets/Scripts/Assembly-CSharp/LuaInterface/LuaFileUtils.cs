using System.Collections.Generic;
using UnityEngine;

namespace LuaInterface
{
	public class LuaFileUtils
	{
		public bool beZip;

		protected List<string> searchPaths;

		protected Dictionary<string, AssetBundle> zipMap;

		protected static LuaFileUtils instance;

		public static LuaFileUtils Instance
		{
			get
			{
				return null;
			}
			protected set
			{
			}
		}

		public virtual void Dispose()
		{
		}

		public bool AddSearchPath(string path, bool front = false)
		{
			return false;
		}

		public bool RemoveSearchPath(string path)
		{
			return false;
		}

		public void AddSearchBundle(string name, AssetBundle bundle)
		{
		}

		public string FindFile(string fileName)
		{
			return null;
		}

		public virtual byte[] ReadFile(string fileName)
		{
			return null;
		}

		public virtual string FindFileError(string fileName)
		{
			return null;
		}

		private byte[] ReadZipFile(string fileName)
		{
			return null;
		}

		public static string GetOSDir()
		{
			return null;
		}
	}
}
