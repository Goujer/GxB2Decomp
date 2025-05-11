using System.IO;
using System.Text;

namespace DragonBones
{
	internal class BinaryDataReader : BinaryReader
	{
		private int i;

		private int readLength;

		private long Length
		{
			get
			{
				return 0L;
			}
		}

		internal BinaryDataReader(Stream stream)
			: base(null)
		{
		}

		internal BinaryDataReader(Stream stream, Encoding encoding)
			: base(null)
		{
		}

		public virtual void Seek(int offset, SeekOrigin origin = SeekOrigin.Current)
		{
		}

		public virtual bool[] ReadBooleans(int offset, int readLength)
		{
			return null;
		}

		public virtual byte[] ReadBytes(int offset, int readLength)
		{
			return null;
		}

		public virtual char[] ReadChars(int offset, int readLength)
		{
			return null;
		}

		public virtual decimal[] ReadDecimals(int offset, int readLength)
		{
			return null;
		}

		public virtual double[] ReadDoubles(int offset, int readLength)
		{
			return null;
		}

		public virtual short[] ReadInt16s(int offset, int readLength)
		{
			return null;
		}

		public virtual int[] ReadInt32s(int offset, int readLength)
		{
			return null;
		}

		public virtual long[] ReadInt64s(int offset, int readLength)
		{
			return null;
		}

		public virtual sbyte[] ReadSBytes(int offset, int readLength)
		{
			return null;
		}

		public virtual float[] ReadSingles(int offset, int readLength)
		{
			return null;
		}

		public virtual string[] ReadStrings(int offset, int readLength)
		{
			return null;
		}

		public virtual ushort[] ReadUInt16s(int offset, int readLength)
		{
			return null;
		}

		public virtual uint[] ReadUInt32s(int offset, int readLength)
		{
			return null;
		}

		public virtual ulong[] ReadUInt64s(int offset, int readLength)
		{
			return null;
		}
	}
}
