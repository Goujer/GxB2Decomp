using System.IO;
using System.Text;

namespace DragonBones
{
	internal class BinaryDataWriter : BinaryWriter
	{
		private long Length
		{
			get
			{
				return 0L;
			}
		}

		public BinaryDataWriter()
		{
		}

		internal BinaryDataWriter(Stream stream)
		{
		}

		public BinaryDataWriter(Encoding encoding)
		{
		}

		internal BinaryDataWriter(Stream stream, Encoding encoding)
		{
		}

		public virtual void Write(bool[] value)
		{
		}

		public override void Write(byte[] value)
		{
		}

		public override void Write(char[] value)
		{
		}

		public virtual void Write(decimal[] value)
		{
		}

		public virtual void Write(double[] value)
		{
		}

		public virtual void Write(short[] value)
		{
		}

		public virtual void Write(int[] value)
		{
		}

		public virtual void Write(long[] value)
		{
		}

		public virtual void Write(sbyte[] value)
		{
		}

		public virtual void Write(float[] value)
		{
		}

		public virtual void Write(string[] value)
		{
		}

		public virtual void Write(ushort[] value)
		{
		}

		public virtual void Write(uint[] value)
		{
		}

		public virtual void Write(ulong[] value)
		{
		}
	}
}
