using System.IO;
using Org.BouncyCastle.Utilities.IO;

namespace Org.BouncyCastle.Asn1
{
	public class Asn1InputStream : FilterStream
	{
		private readonly int limit;

		private readonly byte[][] tmpBuffers;

		public Asn1InputStream(Stream inputStream)
			: base(null)
		{
		}

		public Asn1InputStream(Stream inputStream, int limit)
			: base(null)
		{
		}

		public Asn1InputStream(byte[] input)
			: base(null)
		{
		}

		internal static int FindLimit(Stream input)
		{
			return 0;
		}

		private Asn1Object BuildObject(int tag, int tagNo, int length)
		{
			return null;
		}

		internal Asn1EncodableVector BuildEncodableVector()
		{
			return null;
		}

		internal virtual Asn1EncodableVector BuildDerEncodableVector(DefiniteLengthInputStream dIn)
		{
			return null;
		}

		internal virtual DerSequence CreateDerSequence(DefiniteLengthInputStream dIn)
		{
			return null;
		}

		internal virtual DerSet CreateDerSet(DefiniteLengthInputStream dIn)
		{
			return null;
		}

		public Asn1Object ReadObject()
		{
			return null;
		}

		internal static int ReadTagNumber(Stream s, int tag)
		{
			return 0;
		}

		internal static int ReadLength(Stream s, int limit)
		{
			return 0;
		}

		internal static byte[] GetBuffer(DefiniteLengthInputStream defIn, byte[][] tmpBuffers)
		{
			return null;
		}

		internal static Asn1Object CreatePrimitiveDerObject(int tagNo, DefiniteLengthInputStream defIn, byte[][] tmpBuffers)
		{
			return null;
		}
	}
}
