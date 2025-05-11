using System;

namespace Org.BouncyCastle.Asn1
{
	public class DerUtcTime : Asn1Object
	{
		private readonly string time;

		public string TimeString
		{
			get
			{
				return null;
			}
		}

		[Obsolete]
		public string AdjustedTime
		{
			get
			{
				return null;
			}
		}

		public string AdjustedTimeString
		{
			get
			{
				return null;
			}
		}

		public DerUtcTime(string time)
		{
		}

		public DerUtcTime(DateTime time)
		{
		}

		internal DerUtcTime(byte[] bytes)
		{
		}

		public static DerUtcTime GetInstance(object obj)
		{
			return null;
		}

		public static DerUtcTime GetInstance(Asn1TaggedObject obj, bool isExplicit)
		{
			return null;
		}

		public DateTime ToDateTime()
		{
			return default(DateTime);
		}

		public DateTime ToAdjustedDateTime()
		{
			return default(DateTime);
		}

		private DateTime ParseDateString(string dateStr, string formatStr)
		{
			return default(DateTime);
		}

		private byte[] GetOctets()
		{
			return null;
		}

		internal override void Encode(DerOutputStream derOut)
		{
		}

		protected override bool Asn1Equals(Asn1Object asn1Object)
		{
			return false;
		}

		protected override int Asn1GetHashCode()
		{
			return 0;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
